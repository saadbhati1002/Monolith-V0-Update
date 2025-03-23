
{{Form::open(array('url'=>'contact','method'=>'post','id'=>'create-contact-form'))}}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('name',__('Name'),array('class'=>'form-label'))}}
            {{Form::text('name',null,array('class'=>'form-control','placeholder'=>__('Enter contact name')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('email',__('Email'),array('class'=>'form-label'))}}
            {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter contact email')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('contact_number',__('Contact Number'),array('class'=>'form-label'))}}
            {{Form::number('contact_number',null,array('class'=>'form-control','placeholder'=>__('Enter contact number')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('subject',__('Subject'),array('class'=>'form-label'))}}
            {{Form::text('subject',null,array('class'=>'form-control','placeholder'=>__('Enter contact subject')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('message',__('Message'),array('class'=>'form-label'))}}
            {{Form::textarea('message',null,array('class'=>'form-control','rows'=>5))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {
        $("#create-contact-form").validate({
            rules: {
                name:{
                    required:true
                },
                email: {
                    required: true,
                    email: true
                },
                contact_number: {
                    required: true
                },
                subject: {
                    required: true
                },
                message:{
                    required:true
                }
            },
            messages: {
                name:{
                    required:"The name field is required"
                },
                email: {
                    required: "The email field is required",
                    email: "Enter a valid email address"
                },
                contact_number: {
                    required: "The contact number field is required"
                },
                subject: {
                    required: "The subject field is required"
                },
                message:{
                    required:"The message field is required"
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


