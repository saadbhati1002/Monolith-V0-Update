{{Form::open(array('route'=>array('invoice.payment.store',$invoice_id),'method'=>'post','enctype' => "multipart/form-data",'id'=>'payment-form'))}}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('payment_date',__('Payment Date'),array('class'=>'form-label'))}}
            {{Form::date('payment_date',date('Y-m-d'),array('class'=>'form-control'))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('amount',__('Amount'),array('class'=>'form-label'))}}
            {{Form::number('amount',$invoice->getInvoiceDueAmount(),array('class'=>'form-control'))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('receipt',__('Receipt'),array('class'=>'form-label'))}}
            {{Form::file('receipt',array('class'=>'form-control'))}}
        </div>
        <div class="form-group ">
            {{Form::label('notes',__('Notes'),array('class'=>'form-label'))}}
            {{Form::textarea('notes',null,array('class'=>'form-control','rows'=>3,'placeholder'=>__('Enter Payment Notes')))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Add'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}

<script>
    $(document).ready(function () {
        $("#payment-form").validate({
            rules: {
                payment_date: {
                    required: true,
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
                payment_date: {
                    required: "The payment date field is required",
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


