import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_contact_card.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_demo_data.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_hero_header.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/edit_profile_dialog.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/auth/presentation/cubit/logout_cubit/customer_logout_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_order_history_section.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_management_bottom_sheet.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading || state is ProfileUpdateLoading) {
          showLoading();
        } else if (state is ProfileSuccess) {
          hideLoading();
        } else if (state is ProfileFailure) {
          hideLoading();
          showError(state.message);
        } else if (state is ProfileUpdateSuccess) {
          hideLoading();
          showSuccess('Profile updated successfully');
        } else if (state is ProfileUpdateFailure) {
          hideLoading();
          showError(state.message);
        }
      },
      builder: (context, state) {
        if (state is ProfileSuccess || state is ProfileUpdateSuccess) {
          final customer = state is ProfileSuccess
              ? state.customer
              : (state as ProfileUpdateSuccess).customer;

          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeroHeader(
                  name: customer.name,
                  subtitle: customer.isActive
                      ? 'Active Member'
                      : 'Inactive Member',
                  phone: customer.phone,
                  imageUrl: 'https://i.pravatar.cc/240?img=11',
                  onEditPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => EditProfileDialog(
                        initialName: customer.name,
                        onSave: (newName) {
                          context.read<ProfileCubit>().updateProfile(
                            name: newName,
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      BlocProvider(
                        create: (context) => sl<AddressCubit>(),
                        child: BlocBuilder<AddressCubit, AddressState>(
                          builder: (context, addressState) {
                            String location = 'Loading...';
                            String? locationTitle;
                            if (addressState.status == AddressStatus.success) {
                              final defaultAddress =
                                  addressState.defaultAddress;
                              location =
                                  defaultAddress?.address ??
                                  'No saved location';
                              locationTitle = defaultAddress?.title;
                            } else if (addressState.status ==
                                AddressStatus.failure) {
                              location = 'Failed to load location';
                            }
                            return GestureDetector(
                              onTap: () {
                                final cubit = context.read<AddressCubit>();
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (ctx) => BlocProvider.value(
                                    value: cubit,
                                    child: const AddressManagementBottomSheet(),
                                  ),
                                );
                              },
                              child: ProfileContactCard(
                                location: location,
                                locationTitle: locationTitle,
                                phone: customer.phone,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      BlocProvider(
                        create: (context) => sl<CustomerLogoutCubit>(),
                        child:
                            BlocConsumer<
                              CustomerLogoutCubit,
                              CustomerLogoutState
                            >(
                              listener: (context, state) {
                                if (state is CustomerLogoutLoading) {
                                  showLoading();
                                } else if (state is CustomerLogoutSuccess) {
                                  hideLoading();
                                  showSuccess('Logged out successfully');
                                  context.go(Routes.authTypeScreen);
                                } else if (state is CustomerLogoutFailure) {
                                  hideLoading();
                                  showError(state.errorMessage);
                                }
                              },
                              builder: (context, state) {
                                return BouncingSocialButton(
                                  text: 'Logout',
                                  onTap: () {
                                    context
                                        .read<CustomerLogoutCubit>()
                                        .logout();
                                  },
                                  textColor: const Color(0xFFE53E3E),
                                  color: Colors.white,
                                  radius: 20.r,
                                  height: 52.h,
                                  textSize: 16.sp,
                                  borderColor: const Color(0x55E53E3E),
                                  leading: Icon(
                                    Icons.logout_rounded,
                                    size: 18.sp,
                                    color: const Color(0xFFE53E3E),
                                  ),
                                );
                              },
                            ),
                      ),
                      SizedBox(height: 12.h),
                      ProfileOrderHistorySection(
                        orders: ProfileDemoData.orders,
                      ),
                      SizedBox(height: 104.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
