{{ Form::open(['url' => 'expense', 'method' => 'post', 'enctype' => 'multipart/form-data','id'=>'create-expense-form']) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12 col-lg-12">
            {{ Form::label('title', __('Expense Title'), ['class' => 'form-label']) }}
            {{ Form::text('title', null, ['class' => 'form-control', 'placeholder' => __('Enter Expense Title')]) }}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{ Form::label('expense_id', __('Expense Number'), ['class' => 'form-label']) }}
            <div class="input-group">
                <span class="input-group-text ">
                    {{ expensePrefix() }}
                </span>
                {{ Form::text('expense_id', $billNumber, ['class' => 'form-control', 'placeholder' => __('Enter Expense Number')]) }}
            </div>
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{ Form::label('expense_type', __('Expense Type'), ['class' => 'form-label']) }}
            {{ Form::select('expense_type', $types, null, ['class' => 'form-control hidesearch']) }}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{ Form::label('property_id', __('Property'), ['class' => 'form-label']) }}
            {{ Form::select('property_id', $property, null, ['class' => 'form-control hidesearch', 'id' => 'property_id']) }}
        </div>
        <div class="form-group col-lg-6 col-md-6">
            {{ Form::label('unit_id', __('Unit'), ['class' => 'form-label']) }}
            <div class="unit_div">
                <select class="form-control hidesearch unit" id="unit_id" name="unit_id">
                    <option value="">{{ __('Select Unit') }}</option>
                </select>
            </div>
        </div>
        <div class="form-group  col-md-6 col-lg-6">
            {{ Form::label('date', __('Date'), ['class' => 'form-label']) }}
            {{ Form::date('date', null, ['class' => 'form-control']) }}
        </div>
        <div class="form-group  col-md-6 col-lg-6">
            {{ Form::label('amount', __('Amount'), ['class' => 'form-label']) }}
            {{ Form::number('amount', null, ['class' => 'form-control', 'placeholder' => __('Enter Expense Amount')]) }}
        </div>
        <div class="form-group  col-md-12 col-lg-12">
            {{ Form::label('receipt', __('Receipt'), ['class' => 'form-label']) }}
            {{ Form::file('receipt', ['class' => 'form-control']) }}
        </div>
        <div class="form-group  col-md-12 col-lg-12">
            {{ Form::label('notes', __('Notes'), ['class' => 'form-label']) }}
            {{ Form::textarea('notes', null, ['class' => 'form-control', 'rows' => 3]) }}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{ Form::submit(__('Create'), ['class' => 'btn btn-secondary btn-rounded']) }}
</div>
{{ Form::close() }}
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
                    `<select class="form-control hidesearch unit" id="unit_id" name="unit_id"></select>`;
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
    $(document).ready(function () {
        $("#create-expense-form").validate({
            rules: {
                title: {
                    required: true,
                },
                expense_id:{
                    required:true
                },
                expense_type: {
                    required: true
                },
                property_id:{
                    required:true
                },
                unit_id:{
                    required:true
                },
                date:{
                    required:true
                },
                amount:{
                    required:true
                },
                receipt:{
                    required:true
                },
                notes:{
                    required:true
                }
            },
            messages: {
                title: {
                    required: "The title field is required",
                },
                expense_id:{
                    required:"The expense field is required"
                },
                expense_type: {
                    required: "The expense type field is required"
                },
                property_id:{
                    required:"The property field is required"
                },
                unit_id:{
                    required:"The unit field is required"
                },
                date:{
                    required:"The date field is required"
                },
                amount:{
                    required:"The amount field is required"
                },
                receipt:{
                    required:"The receipt field is required"
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