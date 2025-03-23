@extends('layouts.app')
@section('page-title')
    {{ __('Property Edit') }}
@endsection
@push('script-page')
    <script src="{{ asset('assets/js/vendors/dropzone/dropzone.js') }}"></script>
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
        $('#property-update').on('click', function() {
            "use strict";
            $('#property-update').attr('disabled', true);
            var fd = new FormData();
            var file = document.getElementById('thumbnail').files[0];

            var files = $('#demo-upload').get(0).dropzone.getAcceptedFiles();
            $.each(files, function(key, file) {
                fd.append('property_images[' + key + ']', $('#demo-upload')[0].dropzone
                    .getAcceptedFiles()[key]); // attach dropzone image element
            });
            if (file == undefined) {
                fd.append('thumbnail', '');
            } else {
                fd.append('thumbnail', file);
            }

            var other_data = $('#property_form').serializeArray();
            $.each(other_data, function(key, input) {
                fd.append(input.name, input.value);
            });
            $.ajax({
                url: "{{ route('property.update', $property->id) }}",
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: fd,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(data) {
                    if (data.status == "success") {
                        $('#property-update').attr('disabled', true);
                        toastrs('success', data.msg, 'success');
                        var url = '{{ route('property.show', ':id') }}';
                        url = url.replace(':id', data.id);
                        setTimeout(() => {
                            window.location.href = url;
                        }, "1000");

                    } else {
                        toastrs('Error', data.msg, 'error');
                        $('#property-update').attr('disabled', false);
                    }
                },
                error: function(data) {
                    $('#property-update').attr('disabled', false);
                    if (data.error) {
                        toastrs('Error', data.error, 'error');
                    } else {
                        toastrs('Error', data, 'error');
                    }
                },
            });
        });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#property_form").validate({
                rules: {
                    type: {
                        required: true,
                    },
                    name:{
                        required:true
                    },
                    thumbnail:{
                        required:true
                    },
                    description:{
                        required:true
                    },
                    country:{
                        required:true
                    },
                    state:{
                        required:true
                    },
                    city:{
                        required:true
                    },
                    zip_code:{
                        required:true
                    },
                    address:{
                        required:true
                    },
                    unitname:{
                        required:true
                    },
                    bedroom:{
                        required:true
                    },
                    rent:{
                        required:true
                    },
                    rent_type:{
                        required:true
                    },
                    rent_duration:{
                        required:true
                    },
                    start_date:{
                        required:true
                    },
                    end_date:{
                        required:true
                    },
                    payment_due_date:{
                        required:true
                    },
                    deposit_type:{
                        required:true
                    },
                    deposit_amount:{
                        required:true
                    },
                    late_fee_type:{
                        required:true
                    },
                    late_fee_amount:{
                        required:true
                    },
                    incident_receipt_amount:{
                        required:true
                    },
                    notes:{
                        required:true
                    }
                },
                messages: {
                    type: {
                        required: "The type field is required",
                    },
                    name:{
                        required:"The name field is required"
                    },
                    thumbnail:{
                        required:"The thumbnail field is required"
                    },
                    description:{
                        required:"The description field is required"
                    },
                    country:{
                        required:"The country field is required"
                    },
                    state:{
                        required:"The state field is required"
                    },
                    city:{
                        required:"The city field is required"
                    },
                    zip_code:{
                        required:"The zip code field is required"
                    },
                    address:{
                        required:"The address field is required"
                    },
                    unitname:{
                        required:"The unit name field is required"
                    },
                    bedroom:{
                        required:"The bedroom field is required"
                    },
                    rent:{
                        required:"The rent field is required"
                    },
                    rent_type:{
                        required:"The rent type field is required"
                    },
                    rent_duration:{
                        required:"The rent duration field is required"
                    },
                    start_date:{
                        required:"The start date field is required"
                    },
                    end_date:{
                        required:"The end date field is required"
                    },
                    payment_due_date:{
                        required:"The payment due date field is required"
                    },
                    deposit_type:{
                        required:"The deposit type field is required"
                    },
                    deposit_amount:{
                        required:"The deposit amount field is required"
                    },
                    late_fee_type:{
                        required:"The late fee type field is required"
                    },
                    late_fee_amount:{
                        required:"The late fee amount field is required"
                    },
                    incident_receipt_amount:{
                        required:"The incident receipt amount field is required"
                    },
                    notes:{
                        required:"The notes field is required"
                    }
                },
                errorClass: "text-danger",
                errorElement: "span",
                highlight: function (element) {
                    $(element).addClass("is-invalid");
                },
                unhighlight: function (element) {
                    $(element).removeClass("is-invalid");
                }
            });
        });
    </script>
@endpush
@section('breadcrumb')
    <ul class="breadcrumb mb-0">
        <li class="breadcrumb-item">
            <a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a>
        </li>
        <li class="breadcrumb-item">
            <a href="{{ route('property.index') }}">{{ __('Property') }}</a>
        </li>
        <li class="breadcrumb-item active">
            <a href="#">{{ __('Edit') }}</a>
        </li>
    </ul>
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">

            {{ Form::model($property, ['route' => ['property.update', $property->id], 'method' => 'PUT', 'enctype' => 'multipart/form-data', 'id' => 'property_form']) }}
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="info-group">
                                <div class="form-group ">
                                    {{ Form::label('type', __('Type'), ['class' => 'form-label']) }}
                                    {{ Form::select('type', $types, null, ['class' => 'form-control hidesearch']) }}
                                </div>
                                <div class="form-group">
                                    {{ Form::label('name', __('Name'), ['class' => 'form-label']) }}
                                    {{ Form::text('name', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Name')]) }}
                                </div>
                                <div class="form-group ">
                                    {{ Form::label('description', __('Description'), ['class' => 'form-label']) }}
                                    {{ Form::textarea('description', null, ['class' => 'form-control', 'rows' => 8, 'placeholder' => __('Enter Property Description')]) }}
                                </div>
                                <div class="form-group">
                                    {{ Form::label('thumbnail', __('Thumbnail Image'), ['class' => 'form-label']) }}
                                    {{ Form::file('thumbnail', ['class' => 'form-control']) }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="info-group">
                                <div class="form-group">
                                    {{ Form::label('country', __('Country'), ['class' => 'form-label']) }}
                                    {{ Form::text('country', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Country')]) }}
                                </div>
                                <div class="form-group">
                                    {{ Form::label('state', __('State'), ['class' => 'form-label']) }}
                                    {{ Form::text('state', null, ['class' => 'form-control', 'placeholder' => __('Enter Property State')]) }}
                                </div>
                                <div class="form-group">
                                    {{ Form::label('city', __('City'), ['class' => 'form-label']) }}
                                    {{ Form::text('city', null, ['class' => 'form-control', 'placeholder' => __('Enter Property City')]) }}
                                </div>
                                <div class="form-group">
                                    {{ Form::label('zip_code', __('Zip Code'), ['class' => 'form-label']) }}
                                    {{ Form::text('zip_code', null, ['class' => 'form-control', 'placeholder' => __('Enter Property Zip Code')]) }}
                                </div>
                                <div class="form-group ">
                                    {{ Form::label('address', __('Address'), ['class' => 'form-label']) }}
                                    {{ Form::textarea('address', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('Enter Property Address')]) }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            {{ Form::label('demo-upload', __('Property Images'), ['class' => 'form-label']) }}
                        </div>
                        <div class="card-body">
                            <div class="dropzone needsclick" id='demo-upload' action="#">
                                <div class="dz-message needsclick">
                                    <div class="upload-icon"><i class="fa fa-cloud-upload"></i></div>
                                    <h3>{{ __('Drop files here or click to upload.') }}</h3>
                                </div>
                            </div>
                            <div class="preview-dropzon" style="display: none;">
                                <div class="dz-preview dz-file-preview">
                                    <div class="dz-image"><img data-dz-thumbnail="" src="" alt=""></div>
                                    <div class="dz-details">
                                        <div class="dz-size"><span data-dz-size=""></span></div>
                                        <div class="dz-filename"><span data-dz-name=""></span></div>
                                    </div>
                                    <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""> </span>
                                    </div>
                                    <div class="dz-success-mark"><i class="fa fa-check" aria-hidden="true"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 mb-4">
                    <div class="group-button text-end">
                        {{ Form::submit(__('Update'), ['class' => 'btn btn-secondary btn-rounded', 'id' => 'property-update']) }}
                    </div>
                </div>
            </div>
            {{ Form::close() }}
        </div>
    </div>
@endsection
