{{ Form::model(Auth::User(), array('route' => array('setting.smtp.test'), 'method' => 'POST','id'=>'smtp-test-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-12">
            {{Form::label('email',__('Test Email'),array('class'=>'form-label'))}}
            {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter User Email'),'required'=>'required'))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Send Mail'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#smtp-test-form").validate({
            rules: {
                email:{
                    required:true,
                    email:true
                }
            },
            messages: {
                email:{
                    required:"The email field is required",
                    email:"Please enter a valid email address"
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