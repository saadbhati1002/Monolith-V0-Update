@extends('layouts.app')
@section('page-title')
    {{ __('Invoice') }}
@endsection
@push('script-page')
    <script src="{{ asset('js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('js/jquery.repeater.min.js') }}"></script>
    <script>
        $('#property_id').on('change', function() {
            "use strict";
            var property_id = $(this).val();
            var url = '{{ route('property.unit', ':id') }}';
            url = url.replace(':id', property_id);
            $.ajax({
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: {
                    property_id: property_id,
                },
                contentType: false,
                processData: false,
                type: 'GET',
                success: function(data) {
                    $('.unit').empty();
                    var unit =
                        `<select class="form-control hidesearch unit" id="unit" name="unit_id"></select>`;
                    $('.unit_div').html(unit);

                    $.each(data, function(key, value) {
                        $('.unit').append('<option value="' + key + '">' + value + '</option>');
                    });
                    $(".hidesearch").each(function() {
                        var basic_select = new Choices(this, {
                            searchEnabled: false,
                            removeItemButton: true,
                        });
                    });
                },

            });
        });
    </script>
    <script>
        var selector = "body";
        if ($(selector + " .repeater").length) {
            var $dragAndDrop = $("body .repeater tbody").sortable({

                handle: '.sort-handler'
            });
            var $repeater = $(selector + ' .repeater').repeater({

                initEmpty: false,
                defaultValues: {
                    'status': 1
                },
                show: function() {
                    $(".hidesearch").each(function() {
                        var basic_select = new Choices(this, {
                            searchEnabled: false,
                            removeItemButton: true,
                        });
                    });

                    $(this).slideDown();
                },
                hide: function(deleteElement) {
                    if (confirm('Are you sure you want to delete this element?')) {
                        $(this).slideUp(deleteElement);
                        $(this).remove();

                    }
                },
                ready: function(setIndexes) {
                    $dragAndDrop.on('drop', setIndexes);
                },
                isFirstItemUndeletable: true
            });
            var value = $(selector + " .repeater").attr('data-value');
            if (typeof value != 'undefined' && value.length != 0) {
                value = JSON.parse(value);
                $repeater.setList(value);
            }
        }
    </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script>
    $(document).ready(function () {
        $("#invoice_form").validate({
            rules: {
                property_id: {
                    required: true,
                },
                unit_id:{
                    required:true
                },
                invoice_id:{
                    required:true
                },
                invoice_month:{
                    required:true
                },
                end_date:{
                    required:true
                },
                notes:{
                    required:true
                },
                invoice_type:{
                    required:true
                },
                amount:{
                    required:true
                },
                description:{
                    required:true
                }
            },
            messages: {
                property_id: {
                    required: "The property field is required",
                },
                unit_id:{
                    required:"The unit field is required"
                },
                invoice_id:{
                    required:"The invoice number field is required"
                },
                invoice_month:{
                    required:"The invoice month field is required"
                },
                end_date:{
                    required:"The end date field is required"
                },
                notes:{
                    required:"The notes field is required"
                },
                invoice_type:{
                    required:"The invoice type field is required"
                },
                amount:{
                    required:"The amount field is required"
                },
                description:{
                    required:"The description field is required"
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
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a></li>
    <li class="breadcrumb-item" aria-current="page"><a href="{{ route('invoice.index') }}"> {{ __('Invoice') }}</a></li>
    <li class="breadcrumb-item" aria-current="page"> {{ __('Create') }}</li>
@endsection

@section('content')
    {{ Form::open(['url' => 'invoice', 'method' => 'post', 'id' => 'invoice_form']) }}
    <div class="row mt-4">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="info-group">
                        <div class="row">
                            <div class="form-group col-md-6 col-lg-4">
                                {{ Form::label('property_id', __('Property'), ['class' => 'form-label']) }}
                                {{ Form::select('property_id', $property, null, ['class' => 'form-control hidesearch']) }}
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                {{ Form::label('unit_id', __('Unit'), ['class' => 'form-label']) }}
                                <div class="unit_div">
                                    <select class="form-control hidesearch unit" id="unit" name="unit_id">
                                        <option value="">{{ __('Select Unit') }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <div class="form-group">
                                    {{ Form::label('invoice_id', __('Invoice Number'), ['class' => 'form-label']) }}
                                    <div class="input-group">
                                        <span class="input-group-text ">
                                            {{ invoicePrefix() }}
                                        </span>
                                        {{ Form::text('invoice_id', $invoiceNumber, ['class' => 'form-control', 'placeholder' => __('Enter Invoice Number')]) }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                {{ Form::label('invoice_month', __('Invoice Month'), ['class' => 'form-label']) }}
                                {{ Form::month('invoice_month', null, ['class' => 'form-control']) }}
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                {{ Form::label('end_date', __('Invoice End Date'), ['class' => 'form-label']) }}
                                {{ Form::date('end_date', null, ['class' => 'form-control']) }}
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                {{ Form::label('notes', __('Notes'), ['class' => 'form-label']) }}
                                {{ Form::textarea('notes', null, ['class' => 'form-control', 'rows' => 2, 'placeholder' => __('Enter Notes')]) }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card repeater">
                <div class="card-header">

                    <div class="d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">{{ __('Invoice Type') }}</h5>

                        <a class="btn btn-secondary d-flex align-items-center gap-2" href="#" data-repeater-create="">
                            <i class="ti ti-circle-plus align-text-bottom"></i>{{ __('Add Type') }}</a>

                    </div>

                </div>
                <div class="card-body">
                    <table class="display dataTable cell-border" data-repeater-list="types">
                        <thead>
                            <tr>
                                <th>{{ __('Type') }}</th>
                                <th>{{ __('Amount') }}</th>
                                <th>{{ __('Description') }}</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody data-repeater-item>
                            <tr>
                                <td width="30%">
                                    {{ Form::select('invoice_type', $types, null, ['class' => 'form-control hidesearch']) }}
                                </td>
                                <td>
                                    {{ Form::number('amount', null, ['class' => 'form-control']) }}
                                </td>
                                <td>
                                    {{ Form::textarea('description', null, ['class' => 'form-control', 'rows' => 1]) }}
                                </td>
                                <td>
                                    <a class="text-danger" data-repeater-delete data-bs-toggle="tooltip"
                                        data-bs-original-title="{{ __('Detete') }}" href="#"> <i
                                            data-feather="trash-2"></i></a>
                                </td>
                            </tr>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="group-button text-end">
                {{ Form::submit(__('Create'), ['class' => 'btn btn-secondary btn-rounded', 'id' => 'invoice-submit']) }}
            </div>
        </div>
    </div>
    {{ Form::close() }}
@endsection
