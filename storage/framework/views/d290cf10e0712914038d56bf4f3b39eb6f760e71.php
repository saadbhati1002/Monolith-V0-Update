<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Property Details')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('page-class'); ?>
    product-detail-page
<?php $__env->stopSection(); ?>
<?php $__env->startPush('script-page'); ?>
<?php $__env->stopPush(); ?>


<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Dashboard')); ?></a></li>
    <li class="breadcrumb-item">
        <a href="<?php echo e(route('property.index')); ?>"><?php echo e(__('Property')); ?></a>
    </li>
    <li class="breadcrumb-item active">
        <a href="#"><?php echo e(__('Details')); ?></a>
    </li>
<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-sm-12">
            <div class="">
                <div class="card-header">
                    <div class="row align-items-center g-2">
                        <div class="col">

                        </div>
                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('create property')): ?>
                            <div class="col-auto">
                                <a class="btn btn-secondary" href="<?php echo e(route('property.create')); ?>" data-size="md"> <i
                                        class="ti ti-circle-plus align-text-bottom "></i>
                                    <?php echo e(__('Add Unit')); ?></a>

                                
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="row property-page mt-3">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header pb-0">
                    <ul class="nav nav-tabs profile-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="profile-tab-1" data-bs-toggle="tab" href="#profile-1"
                                role="tab" aria-selected="true">
                                <i class="material-icons-two-tone me-2">meeting_room</i>
                                <?php echo e(__('Property Details')); ?>

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab-2" data-bs-toggle="tab" href="#profile-2" role="tab"
                                aria-selected="true">
                                <i class="material-icons-two-tone me-2">ad_units</i>
                                <?php echo e(__('Property Units')); ?>

                            </a>
                        </li>

                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane show active" id="profile-1" role="tabpanel" aria-labelledby="profile-tab-1">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row justify-content-center">
                                        <div class="col-xl-12 col-xxl-12">
                                            <div class="card border">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-5">
                                                            <div class="sticky-md-top product-sticky">
                                                                <div id="carouselExampleCaptions"
                                                                    class="carousel slide carousel-fade"
                                                                    data-bs-ride="carousel">
                                                                    <div class="carousel-inner">
                                                                        <?php $__currentLoopData = $property->propertyImages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <?php
                                                                                $img = !empty($image->image)
                                                                                    ? $image->image
                                                                                    : 'default.jpg';
                                                                            ?>
                                                                            <div
                                                                                class="carousel-item <?php echo e($key === 0 ? 'active' : ''); ?>">
                                                                                <img src="<?php echo e(asset(Storage::url('upload/property') . '/' . $img)); ?>"
                                                                                    class="d-block w-100 rounded"
                                                                                    alt="Product image" />
                                                                            </div>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </div>
                                                                    <ol
                                                                        class="carousel-indicators position-relative product-carousel-indicators my-sm-3 mx-0">
                                                                        <?php $__currentLoopData = $property->propertyImages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <?php
                                                                                $img = !empty($image->image)
                                                                                    ? $image->image
                                                                                    : 'default.jpg';
                                                                            ?>
                                                                            <li data-bs-target="#carouselExampleCaptions"
                                                                                data-bs-slide-to="<?php echo e($key); ?>"
                                                                                class="<?php echo e($key === 0 ? 'active' : ''); ?> w-25 h-auto">
                                                                                <img src="<?php echo e(asset(Storage::url('upload/property') . '/' . $img)); ?>"
                                                                                    class="d-block wid-50 rounded"
                                                                                    alt="Product image" />
                                                                            </li>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </ol>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-7">

                                                            <h3 class="">
                                                                <?php echo e(ucfirst($property->name)); ?>


                                                            </h3>
                                                            <span class="badge bg-light-primary f-14 mt-1"
                                                                data-bs-toggle="tooltip"
                                                                data-bs-original-title="<?php echo e(__('Type')); ?>"><?php echo e(\App\Models\Property::$Type[$property->type]); ?></span>
                                                            <h5 class="mt-4"><?php echo e(__('Property Details')); ?></h5>
                                                            <hr class="my-3" />
                                                            <p class="text-muted">
                                                                <?php echo e($property->description); ?>

                                                            </p>

                                                            <h5><?php echo e(__('Property Address')); ?></h5>
                                                            <hr class="my-3" />
                                                            <div class="mb-1 row">
                                                                <label
                                                                    class="col-form-label col-lg-3 col-sm-12 text-lg-end">
                                                                    <?php echo e(__('Address')); ?> :

                                                                </label>
                                                                <div
                                                                    class="col-lg-6 col-md-12 col-sm-12 d-flex align-items-center">
                                                                    <?php echo e($property->address); ?>

                                                                </div>
                                                            </div>
                                                            <div class="mb-1 row">
                                                                <label
                                                                    class="col-form-label col-lg-3 col-sm-12 text-lg-end">
                                                                    <?php echo e(__('Location')); ?> :

                                                                </label>
                                                                <div
                                                                    class="col-lg-6 col-md-12 col-sm-12 d-flex align-items-center">
                                                                    <?php echo e($property->city . ', ' . $property->state . ', ' . $property->country); ?>

                                                                </div>
                                                            </div>
                                                            <div class="mb-1 row">
                                                                <label
                                                                    class="col-form-label col-lg-3 col-sm-12 text-lg-end">
                                                                    <?php echo e(__('Zip Code')); ?> :

                                                                </label>
                                                                <div
                                                                    class="col-lg-6 col-md-12 col-sm-12 d-flex align-items-center">
                                                                    <?php echo e($property->zip_code); ?>

                                                                </div>
                                                            </div>

                                                            <hr class="my-3" />

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane " id="profile-2" role="tabpanel" aria-labelledby="profile-tab-2">
                            <div class="row">
                                <?php $__currentLoopData = $units; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $unit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="col-xxl-3 col-xl-4 col-md-6">
                                        <div class="card follower-card">
                                            <div class="card-body p-3">
                                                <div class="d-flex align-items-start mb-3">
                                                    <div class="flex-grow-1 ">
                                                        <h2 class="mb-1 text-truncate"><?php echo e(ucfirst($unit->name)); ?></h2>
                                                    </div>
                                                    <div class="flex-shrink-0">
                                                        <div class="dropdown">
                                                            <a class="dropdown-toggle text-primary opacity-50 arrow-none"
                                                                href="#" data-bs-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                                <i class="ti ti-dots f-16"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">

                                                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('edit unit')): ?>
                                                                    <a class="dropdown-item customModal" href="#"
                                                                        data-url="<?php echo e(route('unit.edit', [$property->id, $unit->id])); ?>"
                                                                        data-title="<?php echo e(__('Edit Unit')); ?>" data-size="lg">
                                                                        <i
                                                                            class="material-icons-two-tone">edit</i><?php echo e(__('Edit Unit')); ?></a>
                                                                <?php endif; ?>

                                                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('delete unit')): ?>
                                                                    <?php echo Form::open([
                                                                        'method' => 'DELETE',
                                                                        'route' => ['unit.destroy', $property->id, $unit->id],
                                                                        'id' => 'unit-' . $unit->id,
                                                                    ]); ?>


                                                                    <a class="dropdown-item confirm_dialog" href="#">
                                                                        <i class="material-icons-two-tone">delete</i>
                                                                        <?php echo e(__('Delete Unit')); ?>


                                                                    </a>
                                                                    <?php echo Form::close(); ?>

                                                                <?php endif; ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-3" />


                                                <div class="row">
                                                    <p class="mb-1"><?php echo e(__('Bedroom')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->bedroom); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Kitchen')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->kitchen); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Bath')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->baths); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Rent Type')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->rent_type); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Rent')); ?> :
                                                        <span class="text-muted"><?php echo e(priceFormat($unit->rent)); ?></span>
                                                    </p>

                                                    <?php if($unit->rent_type == 'custom'): ?>
                                                        <p class="mb-1"><?php echo e(__('Start Date')); ?> :
                                                            <span class="text-muted"><?php echo e($unit->start_date); ?></span>
                                                        </p>
                                                        <p class="mb-1"><?php echo e(__('End Date')); ?> :
                                                            <span class="text-muted"><?php echo e($unit->end_date); ?></span>
                                                        </p>
                                                        <p class="mb-1"><?php echo e(__('Payment Due Date')); ?> :
                                                            <span class="text-muted"><?php echo e($unit->payment_due_date); ?></span>
                                                        </p>
                                                    <?php else: ?>
                                                        <p class="mb-1"><?php echo e(__('Rent Duration')); ?> :
                                                            <span class="text-muted"><?php echo e($unit->rent_duration); ?></span>
                                                        </p>
                                                    <?php endif; ?>

                                                    <p class="mb-1"><?php echo e(__('Deposit Type')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->deposit_type); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Deposit Amount')); ?> :
                                                        <span class="text-muted">
                                                            <?php echo e($unit->deposit_type == 'fixed' ? priceFormat($unit->deposit_amount) : $unit->deposit_amount . '%'); ?>

                                                        </span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Late Fee Type')); ?> :
                                                        <span class="text-muted"><?php echo e($unit->late_fee_type); ?></span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Late Fee Amount')); ?> :
                                                        <span class="text-muted">
                                                            <?php echo e($unit->late_fee_type == 'fixed' ? priceFormat($unit->late_fee_amount) : $unit->late_fee_amount . '%'); ?>

                                                        </span>
                                                    </p>
                                                    <p class="mb-1"><?php echo e(__('Incident Receipt Amount')); ?> :
                                                        <span
                                                            class="text-muted"><?php echo e(priceFormat($unit->incident_receipt_amount)); ?></span>
                                                    </p>
                                                </div>

                                                <hr class="my-2" />
                                                <p class="my-3 text-muted text-sm">
                                                    <?php echo e($unit->notes); ?>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/property/show.blade.php ENDPATH**/ ?>