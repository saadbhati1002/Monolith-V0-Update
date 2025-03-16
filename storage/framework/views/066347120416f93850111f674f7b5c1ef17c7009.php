<div class="modal-body">
    <div class="product-card">
        <div class="row align-items-center">

            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Property')); ?> :</b>
                     <?php echo e(!empty($maintenanceRequest->properties)?$maintenanceRequest->properties->name:'-'); ?>

                </p>
            </div>
            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Unit')); ?> :</b>
                    <?php echo e(!empty($maintenanceRequest->units)?$maintenanceRequest->units->name:'-'); ?>

                </p>
            </div>
            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Issue')); ?> :</b>
                    <?php echo e(!empty($maintenanceRequest->types)?$maintenanceRequest->types->title:'-'); ?>

                </p>
            </div>
            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Maintainer')); ?> :</b>
                     <?php echo e(!empty($maintenanceRequest->maintainers)?$maintenanceRequest->maintainers->name:'-'); ?>

                </p>
            </div>

            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Request Date')); ?> :</b>
                    <?php echo e(dateFormat($maintenanceRequest->request_date)); ?>

                </p>
            </div>
            <?php if(!empty($maintenanceRequest->fixed_date)): ?>
                <div class="col-6">
                    <p class="mb-1 mt-2">
                        <b><?php echo e(__('Fixed Date')); ?> :</b>
                         <?php echo e(dateFormat($maintenanceRequest->fixed_date)); ?>

                    </p>
                </div>
            <?php endif; ?>
            <?php if($maintenanceRequest->amount!=0): ?>
                <div class="col-6">
                    <p class="mb-1 mt-2">
                        <b><?php echo e(__('Amount')); ?> :</b>
                         <?php echo e(priceFormat($maintenanceRequest->amount)); ?>

                    </p>
                </div>
            <?php endif; ?>
            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Status')); ?> :</b>

                        <?php if($maintenanceRequest->status=='pending'): ?>
                            <span
                                class="badge bg-light-warning"> <?php echo e(\App\Models\MaintenanceRequest::$status[$maintenanceRequest->status]); ?></span>
                        <?php elseif($maintenanceRequest->status=='in_progress'): ?>
                            <span
                                class="badge bg-light-info"> <?php echo e(\App\Models\MaintenanceRequest::$status[$maintenanceRequest->status]); ?></span>
                        <?php else: ?>
                            <span
                                class="badge bg-light-primary"> <?php echo e(\App\Models\MaintenanceRequest::$status[$maintenanceRequest->status]); ?></span>
                        <?php endif; ?>

                </p>
            </div>

            <?php if(!empty($maintenanceRequest->invoice)): ?>
                <div class="col-6">
                    <p class="mb-1 mt-2">
                        <b><?php echo e(__('Invoice')); ?> :</b>

                            <a href="<?php echo e(asset(Storage::url('upload/invoice')).'/'.$maintenanceRequest->invoice); ?>"
                               download="download"><i class="fa fa-download"></i></a>

                    </p>
                </div>
            <?php endif; ?>

            <div class="col-6">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Attachment')); ?> :</b>

                        <?php if(!empty($maintenanceRequest->issue_attachment)): ?>
                            <a href="<?php echo e(asset(Storage::url('upload/issue_attachment')).'/'.$maintenanceRequest->issue_attachment); ?> "
                               download="download"><i class="fa fa-download"></i></a>
                        <?php else: ?>
                            -
                        <?php endif; ?>

                </p>
            </div>
            <div class="col-12">
                <p class="mb-1 mt-2">
                    <b><?php echo e(__('Notes')); ?> :</b>
                    <?php echo e($maintenanceRequest->notes); ?>

                </p>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/maintenance_request/show.blade.php ENDPATH**/ ?>