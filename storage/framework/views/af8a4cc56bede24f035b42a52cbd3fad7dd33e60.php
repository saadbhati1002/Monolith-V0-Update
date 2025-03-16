<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Tenant Details')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('page-class'); ?>
    cdxuser-profile
<?php $__env->stopSection(); ?>
<?php $__env->startPush('script-page'); ?>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item">
        <a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Dashboard')); ?></a>
    </li>
    <li class="breadcrumb-item" aria-current="page"><a href="<?php echo e(route('tenant.index')); ?>"> <?php echo e(__('Tenant')); ?></a></li>
    <li class="breadcrumb-item active">
        <a href="#"><?php echo e(__('Details')); ?></a>
    </li>
<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 col-xxl-3">
                            <div class="card border">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-shrink-0">
                                            <img class="img-radius img-fluid wid-80"
                                                src="<?php echo e(!empty($tenant->user) && !empty($tenant->user->profile) ? asset(Storage::url('upload/profile/' . $tenant->user->profile)) : asset(Storage::url('upload/profile/avatar.png'))); ?>"
                                                alt="User image" />
                                        </div>
                                        <div class="flex-grow-1 mx-3">
                                            <h5 class="mb-1">
                                                <?php echo e(ucfirst(!empty($tenant->user) ? $tenant->user->first_name : '') . ' ' . ucfirst(!empty($tenant->user) ? $tenant->user->last_name : '')); ?>

                                            </h5>
                                            <h6 class="mb-0 text-secondary"><?php echo $tenant->LeaseLeftDay(); ?></h6>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-body px-2 pb-0">
                                    <div class="list-group list-group-flush">
                                        <a href="#" class="list-group-item list-group-item-action">
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <i class="material-icons-two-tone f-20">email</i>
                                                </div>
                                                <div class="flex-grow-1 mx-3">
                                                    <h5 class="m-0"><?php echo e(__('Email')); ?></h5>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <small><?php echo e(!empty($tenant->user) ? $tenant->user->email : '-'); ?></small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item list-group-item-action">
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <i class="material-icons-two-tone f-20">phonelink_ring</i>
                                                </div>
                                                <div class="flex-grow-1 mx-3">
                                                    <h5 class="m-0"><?php echo e(__('Phone')); ?></h5>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <small><?php echo e(!empty($tenant->user) ? $tenant->user->phone_number : '-'); ?>

                                                    </small>
                                                </div>
                                            </div>
                                        </a>


                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-8 col-xxl-9">
                            <div class="card border">
                                <div class="card-header">
                                    <h5><?php echo e(__('Additional Information')); ?></h5>
                                </div>
                                <div class="card-body">
                                    
                                    
                                    <div class="table-responsive">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Total Family Member')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->family_member) ? $tenant->family_member : '-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Country')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->country) ? $tenant->country : '-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('State')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->state) ? $tenant->state : '-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('City')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->city) ? $tenant->city : '-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Zip Code')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->zip_code) ? $tenant->zip_code :'-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Property')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->properties) ? $tenant->properties->name : '-'); ?>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Unit')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->units) ? $tenant->units->name : '-'); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Lease Start Date')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(dateFormat($tenant->lease_start_date)); ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Lease End Date')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(dateFormat($tenant->lease_end_date)); ?></td>
                                                </tr>
                                                <?php if(!empty($tenant->documents)): ?>
                                                    <tr>
                                                        <td><b class="text-header"><?php echo e(__('Documents')); ?></b></td>
                                                        <td>:</td>
                                                        <td>
                                                            <?php $__currentLoopData = $tenant->documents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $doc): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <a href="<?php echo e(asset(Storage::url('upload/tenant')) . '/' . $doc->document); ?>"
                                                                    target="_blank"><i data-feather="download"></i></a>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </td>
                                                    </tr>
                                                <?php endif; ?>
                                                <tr>
                                                    <td><b class="text-header"><?php echo e(__('Address')); ?></b></td>
                                                    <td>:</td>
                                                    <td><?php echo e(!empty($tenant->address) ? $tenant->address : '-'); ?></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/tenant/show.blade.php ENDPATH**/ ?>