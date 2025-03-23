{{Form::model($unit, array('route' => array('unit.update', $property_id,$unit->id), 'method' => 'PUT','id'=>'edit-unit-form')) }}

<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('name',__('Name'),array('class'=>'form-label'))}}
            {{Form::text('name',null,array('class'=>'form-control','placeholder'=>__('Enter unit name')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('bedroom',__('Bedroom'),array('class'=>'form-label'))}}
            {{Form::number('bedroom',null,array('class'=>'form-control','placeholder'=>__('Enter number of bedroom')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('kitchen',__('Kitchen'),array('class'=>'form-label'))}}
            {{Form::number('kitchen',null,array('class'=>'form-control','placeholder'=>__('Enter number of kitchen')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('baths',__('Bath'),array('class'=>'form-label'))}}
            {{Form::number('baths',null,array('class'=>'form-control','placeholder'=>__('Enter number of bath')))}}
        </div>
        <div class="form-group  col-md-6">
            {{Form::label('rent',__('Rent'),array('class'=>'form-label'))}}
            {{Form::number('rent',null,array('class'=>'form-control','placeholder'=>__('Enter unit rent')))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('rent_type',__('Rent Type'),array('class'=>'form-label'))}}
            {{Form::select('rent_type',$rentTypes,null,array('class'=>'form-control basic-select','id'=>'rent_type'))}}
        </div>
        <div class="form-group  col-md-12 rent_type monthly ">
            {{Form::label('rent_duration',__('Rent Duration'),array('class'=>'form-label'))}}
            {{Form::number('rent_duration',null,array('class'=>'form-control','placeholder'=>__('Enter day of month between 1 to 30')))}}
        </div>
        <div class="form-group  col-md-12 rent_type yearly d-none">
            {{Form::label('rent_duration',__('Rent Duration'),array('class'=>'form-label'))}}
            {{Form::number('rent_duration',null,array('class'=>'form-control','placeholder'=>__('Enter month of year between 1 to 12'),'disabled'))}}
        </div>
        <div class="form-group  col-md-4 rent_type custom d-none">
            {{Form::label('start_date',__('Start Date'),array('class'=>'form-label'))}}
            {{Form::date('start_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group  col-md-4 rent_type custom d-none">
            {{Form::label('end_date',__('End Date'),array('class'=>'form-label'))}}
            {{Form::date('end_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group  col-md-4 rent_type custom d-none">
            {{Form::label('payment_due_date',__('Payment Due Date'),array('class'=>'form-label'))}}
            {{Form::date('payment_due_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('deposit_type',__('Deposit Type'),array('class'=>'form-label'))}}
            {{Form::select('deposit_type',$types,null,array('class'=>'form-control basic-select'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('deposit_amount',__('Deposit Amount'),array('class'=>'form-label'))}}
            {{Form::number('deposit_amount',null,array('class'=>'form-control','placeholder'=>__('Enter deposit amount')))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('late_fee_type',__('Late Fee Type'),array('class'=>'form-label'))}}
            {{Form::select('late_fee_type',$types,null,array('class'=>'form-control basic-select'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('late_fee_amount',__('Late Fee Amount'),array('class'=>'form-label'))}}
            {{Form::number('late_fee_amount',null,array('class'=>'form-control','placeholder'=>__('Enter late fee amount')))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('incident_receipt_amount',__('Incident Receipt Amount'),array('class'=>'form-label'))}}
            {{Form::number('incident_receipt_amount',null,array('class'=>'form-control','placeholder'=>__('Enter incident receipt amount')))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('notes',__('Notes'),array('class'=>'form-label'))}}
            {{Form::textarea('notes',null,array('class'=>'form-control','rows'=>2,'placeholder'=>__('Enter notes')))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Update'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $('#rent_type').on('change', function() {
        "use strict";
        var type=this.value;
        $('.rent_type').addClass('d-none')
        $('.'+type).removeClass('d-none')

        var input1= $('.rent_type').find('input');
        input1.prop('disabled', true);
        var input2= $('.'+type).find('input');
        input2.prop('disabled', false);
    });
    $('#rent_type').trigger('change');

</script>
<script>
    $(document).ready(function () {
        $("#edit-unit-form").validate({
            rules: {
                name: {
                    required: true,
                },
                property_id:{
                    required:true
                },
                bedroom: {
                    required: true
                },
                kitchen:{
                    required:true
                },
                baths:{
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
                name: {
                    required: "The name field is required",
                },
                property_id:{
                    required:"The property field is required"
                },
                bedroom: {
                    required: "The bedroom field is required"
                },
                kitchen:{
                    required:"The kitchen field is required"
                },
                baths:{
                    required:"The baths field is required"
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
                    required:"The incident receipt field is required"
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
