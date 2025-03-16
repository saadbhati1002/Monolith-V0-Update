<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Property Create')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startPush('script-page'); ?>
    <script src="<?php echo e(asset('assets/js/vendors/dropzone/dropzone.js')); ?>"></script>
    <script>
        var dropzone = new Dropzone('#demo-upload', {
            previewTemplate: document.querySelector('.preview-dropzon').innerHTML,
            parallelUploads: 10,
            thumbnailHeight: 120,
            thumbnailWidth: 120,
            maxFilesize: 10,
            filesizeBase: 1000,
            autoProcessQueue: false,
            thumbnail: function(file, dataUrl) {
                if (file.previewElement) {
                    file.previewElement.classList.remove("dz-file-preview");
                    var images = file.previewElement.querySelectorAll("[data-dz-thumbnail]");
                    for (var i = 0; i < images.length; i++) {
                        var thumbnailElement = images[i];
                        thumbnailElement.alt = file.name;
                        thumbnailElement.src = dataUrl;
                    }
                    setTimeout(function() {
                        file.previewElement.classList.add("dz-image-preview");
                    }, 1);
                }
            }

        });
        $('#property-submit').on('click', function() {
            "use strict";
            $('#property-submit').attr('disabled', true);
            var fd = new FormData();
            var file = document.getElementById('thumbnail').files[0];

            var files = $('#demo-upload').get(0).dropzone.getAcceptedFiles();
            $.each(files, function(key, file) {
                fd.append('property_images[' + key + ']', $('#demo-upload')[0].dropzone
                    .getAcceptedFiles()[key]); // attach dropzone image element
            });
            fd.append('thumbnail', file);
            var other_data = $('#property_form').serializeArray();
            $.each(other_data, function(key, input) {
                fd.append(input.name, input.value);
            });
            $.ajax({
                url: "<?php echo e(route('property.store')); ?>",
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: fd,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(data) {
                    if (data.status == "success") {
                        $('#property-submit').attr('disabled', true);
                        toastrs(data.status, data.msg, data.status);
                        var url = '<?php echo e(route('property.show', ':id')); ?>';
                        url = url.replace(':id', data.id);
                        setTimeout(() => {
                            window.location.href = url;
                        }, "1000");

                    } else {
                        toastrs('Error', data.msg, 'error');
                        $('#property-submit').attr('disabled', false);
                    }
                },
                error: function(data) {
                    $('#property-submit').attr('disabled', false);
                    if (data.error) {
                        toastrs('Error', data.error, 'error');
                    } else {
                        toastrs('Error', data, 'error');
                    }
                },
            });
        });
    </script>

    <script>
        $('#rent_type').on('change', function() {
            "use strict";
            var type = this.value;
            $('.rent_type').addClass('d-none')
            $('.' + type).removeClass('d-none')

            var input1 = $('.rent_type').find('input');
            input1.prop('disabled', true);
            var input2 = $('.' + type).find('input');
            input2.prop('disabled', false);
        });
    </script>

    <script>
        $(document).ready(function() {
            $('.nextButton').on('click', function() {
                let $activeTab = $('.tab-content .tab-pane.active'); // Current active tab
                let $nextTab = $activeTab.next('.tab-pane'); // Next tab

                if ($nextTab.length > 0) {
                    let nextTabId = $nextTab.attr('id');
                    $('a[href="#' + nextTabId + '"]').tab('show'); // Move to next tab

                    // If the next tab is the last, change the button text to "Submit"
                    if ($nextTab.is(':last-child')) {
                        $(this).text('Submit').addClass('submit-button');
                    }
                } else if ($(this).hasClass('submit-button')) {
                    // Handle form submission
                    $('form').submit();
                }
            });

            // Update button text on manual tab switch
            $('a[data-toggle="tab"]').on('shown.bs.tab', function() {
                let $activeTab = $('.tab-content .tab-pane.active');
                let isLastTab = $activeTab.is(':last-child');

                if (!isLastTab) {
                    $('.nextButton').text('Next').removeClass('submit-button');
                }
            });
        });
    </script>


<script>
    $(document).ready(function() {

        function toggleRemoveServiceButton() {
            let serviceCount = $('.unit_list').length;
            $('.remove-service').toggle(serviceCount > 1);
        }

        $(document).on('click', '.add-unit', function() {
            let originalRow = $('.unit_list:first');
            // console.log(originalRow)
            // originalRow.find('select.select2-hidden-accessible').select2('destroy');

            let clonedRow = originalRow.clone();
            console.log(clonedRow);

            clonedRow.find('input, select').val('');
            clonedRow.find('.description').val('');

            let rowIndex = $('.unit_list').length;
            clonedRow.find('select[name^="skill"]').each(function() {
                $(this).attr('name', 'skill[' + rowIndex + '][]');
            });

            let hrElement = $('<hr class="mt-2 mb-4 border-dark">');
            $('.unit_list_results').append(clonedRow).append(hrElement);

            originalRow.find('.select2').select2();
            clonedRow.find('.select2').select2();

            toggleRemoveServiceButton();

        });

        $(document).on('click', '.remove-service', function() {
            $(this).parent().parent().closest('.unit_list').next('hr').remove();
            $(this).parent().parent().closest('.unit_list').remove();
            toggleRemoveServiceButton();
        });

        toggleRemoveServiceButton();
    });
</script>


<?php $__env->stopPush(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Dashboard')); ?></a></li>
    <li class="breadcrumb-item">
        <a href="<?php echo e(route('property.index')); ?>"><?php echo e(__('Property')); ?></a>
    </li>
    <li class="breadcrumb-item active"><a href="#"><?php echo e(__('Create')); ?></a>
    </li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <?php echo e(Form::open(['url' => 'property', 'method' => 'post', 'enctype' => 'multipart/form-data', 'id' => 'property_form'])); ?>

    <div class="row mt-4">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header pb-0">
                    <ul class="nav nav-tabs profile-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="profile-tab-1" data-bs-toggle="tab" href="#profile-1"
                                role="tab" aria-selected="true">
                                <i class="material-icons-two-tone me-2">info</i>
                                <?php echo e(__('Property Details')); ?>

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab-2" data-bs-toggle="tab" href="#profile-2" role="tab"
                                aria-selected="true">
                                <i class="material-icons-two-tone me-2">image</i>
                                <?php echo e(__('Property Images')); ?>

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab-3" data-bs-toggle="tab" href="#profile-3" role="tab"
                                aria-selected="true">
                                <i class="material-icons-two-tone me-2">layers</i>
                                <?php echo e(__('Unit')); ?>

                            </a>
                        </li>

                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane " id="profile-1" role="tabpanel" aria-labelledby="profile-tab-1">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card border">
                                        <div class="card-header">
                                            <h5> <?php echo e(__('Add Property Details')); ?></h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="mb-3">
                                                        <div class="form-group ">
                                                            <?php echo e(Form::label('type', __('Type'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::select('type', $types, null, ['class' => 'form-control basic-select', 'required' => 'required'])); ?>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('name', __('Name'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::text('name', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Name'), 'required' => 'required'])); ?>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('thumbnail', __('Thumbnail Image'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::file('thumbnail', ['class' => 'form-control', 'required' => 'required'])); ?>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="mb-3">
                                                        <div class="form-group ">
                                                            <?php echo e(Form::label('description', __('Description'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::textarea('description', null, ['class' => 'form-control', 'rows' => 4, 'placeholder' => __('Enter Property Description'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('country', __('Country'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::text('country', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Country'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('state', __('State'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::text('state', null, ['class' => 'form-control', 'placeholder' => __('Enter Property State'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('city', __('City'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::text('city', null, ['class' => 'form-control', 'placeholder' => __('Enter Property City'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <?php echo e(Form::label('zip_code', __('Zip Code'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::text('zip_code', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Zip Code'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="mb-3">
                                                        <div class="form-group ">
                                                            <?php echo e(Form::label('address', __('Address'), ['class' => 'form-label'])); ?>

                                                            <?php echo e(Form::textarea('address', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('Enter Property Address'), 'required' => 'required'])); ?>

                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-end mt-3">
                                <button type="button" class="btn btn-secondary btn-rounded nextButton"
                                    data-next-tab="#profile-2">
                                    <?php echo e(__('Next')); ?>

                                </button>


                            </div>
                        </div>
                        <div class="tab-pane" id="profile-2" role="tabpanel" aria-labelledby="profile-tab-2">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card border">
                                        <div class="card-header">
                                            <?php echo e(Form::label('demo-upload', __('Add Property Images'), ['class' => 'form-label'])); ?>

                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="dropzone needsclick" id='demo-upload' action="#">
                                                    <div class="dz-message needsclick">
                                                        <div class="upload-icon"><i class="fa fa-cloud-upload"></i></div>
                                                        <h3><?php echo e(__('Drop files here or click to upload.')); ?></h3>
                                                    </div>
                                                </div>
                                                <div class="preview-dropzon" style="display: none;">
                                                    <div class="dz-preview dz-file-preview">
                                                        <div class="dz-image"><img data-dz-thumbnail="" src=""
                                                                alt=""></div>
                                                        <div class="dz-details">
                                                            <div class="dz-size"><span data-dz-size=""></span></div>
                                                            <div class="dz-filename"><span data-dz-name=""></span></div>
                                                        </div>
                                                        <div class="dz-progress"><span class="dz-upload"
                                                                data-dz-uploadprogress=""> </span></div>
                                                        <div class="dz-success-mark"><i class="fa fa-check"
                                                                aria-hidden="true"></i></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-end mt-3">
                                <button type="button" class="btn btn-secondary btn-rounded nextButton"
                                    data-next-tab="#profile-2">
                                    <?php echo e(__('Next')); ?>

                                </button>
                            </div>
                        </div>
                        <div class="tab-pane show active" id="profile-3" role="tabpanel"
                            aria-labelledby="profile-tab-3">
                            <div class="card border">
                                <div class="card-header">
                                    <h5><?php echo e(__('Add Unit')); ?></h5>
                                </div>
                                <div class="card-body">
                                    <div class="row unit_list">
                                            <div class="form-group col-md-4">
                                                <?php echo e(Form::label('unitname', __('Name'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::text('unitname', null, ['class' => 'form-control', 'placeholder' => __('Enter unit name'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2">
                                                <?php echo e(Form::label('bedroom', __('Bedroom'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('bedroom', null, ['class' => 'form-control', 'placeholder' => __('Enter number of bedroom'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2">
                                                <?php echo e(Form::label('kitchen', __('Kitchen'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('kitchen', null, ['class' => 'form-control', 'placeholder' => __('Enter number of kitchen'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2">
                                                <?php echo e(Form::label('baths', __('Bath'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('baths', null, ['class' => 'form-control', 'placeholder' => __('Enter number of bath'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2">
                                                <?php echo e(Form::label('rent', __('Rent'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('rent', null, ['class' => 'form-control', 'placeholder' => __('Enter unit rent'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-6">
                                                <?php echo e(Form::label('rent_type', __('Rent Type'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::select('rent_type', $rentTypes, null, ['class' => 'form-control select2 basic-select', 'id' => 'rent_type', 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2 rent_type monthly">
                                                <?php echo e(Form::label('rent_duration', __('Rent Duration'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('rent_duration', null, ['class' => 'form-control', 'placeholder' => __('Enter day of month between 1 to 30')])); ?>

                                            </div>
                                            <div class="form-group col-md-4 rent_type yearly d-none">
                                                <?php echo e(Form::label('rent_duration', __('Rent Duration'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('rent_duration', null, ['class' => 'form-control', 'placeholder' => __('Enter month of year between 1 to 12'), 'disabled'])); ?>

                                            </div>
                                            <div class="form-group col-md-2 rent_type custom d-none">
                                                <?php echo e(Form::label('start_date', __('Start Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('start_date', null, ['class' => 'form-control', 'disabled'])); ?>

                                            </div>
                                            <div class="form-group col-md-2 rent_type custom d-none">
                                                <?php echo e(Form::label('end_date', __('End Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('end_date', null, ['class' => 'form-control', 'disabled'])); ?>

                                            </div>
                                            <div class="form-group col-md-2 rent_type custom d-none">
                                                <?php echo e(Form::label('payment_due_date', __('Payment Due Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('payment_due_date', null, ['class' => 'form-control', 'disabled'])); ?>

                                            </div>
                                            <div class="form-group col-md-4">
                                                <?php echo e(Form::label('deposit_type', __('Deposit Type'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::select('deposit_type', $types, null, ['class' => 'form-control select2 basic-select', 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-3">
                                                <?php echo e(Form::label('deposit_amount', __('Deposit Amount'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('deposit_amount', null, ['class' => 'form-control', 'placeholder' => __('Enter deposit amount'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-3">
                                                <?php echo e(Form::label('late_fee_type', __('Late Fee Type'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::select('late_fee_type', $types, null, ['class' => 'form-control select2 basic-select', 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-2">
                                                <?php echo e(Form::label('late_fee_amount', __('Late Fee Amount'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('late_fee_amount', null, ['class' => 'form-control', 'placeholder' => __('Enter late fee amount'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-4">
                                                <?php echo e(Form::label('incident_receipt_amount', __('Incident Receipt Amount'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('incident_receipt_amount', null, ['class' => 'form-control', 'placeholder' => __('Enter incident receipt amount'), 'required' => 'required'])); ?>

                                            </div>
                                            <div class="form-group col-md-12">
                                                <?php echo e(Form::label('notes', __('Notes'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::textarea('notes', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('Enter notes')])); ?>

                                            </div>
                                    </div>

                                    <hr class="mt-2 mb-4 border border-secondary">
                                    <div class="unit_list_results"></div>

                                    <div class="col-lg-12 mb-2  text-end">
                                        <button type="button" class="btn btn-secondary btn-md add-unit ">
                                            <?php echo e(__('Add Unit')); ?>

                                        </button>
                                    </div>

                                </div>
                            </div>


                            <div class="col-lg-12 mb-2">
                                <div class="group-button text-end">
                                    <?php echo e(Form::submit(__('Create'), ['class' => 'btn btn-secondary btn-rounded nextButton', 'id' => 'property-submit'])); ?>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/property/create.blade.php ENDPATH**/ ?>