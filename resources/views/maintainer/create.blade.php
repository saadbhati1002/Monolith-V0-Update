{{ Form::open(array('url' => 'maintainer','enctype' => "multipart/form-data",'id'=>'create-maintainer-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('first_name',__('First Name'),array('class'=>'form-label'))}}
            {{Form::text('first_name',null,array('class'=>'form-control','placeholder'=>__('Enter First Name')))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('last_name',__('Last Name'),array('class'=>'form-label'))}}
            {{Form::text('last_name',null,array('class'=>'form-control','placeholder'=>__('Enter Last Name')))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('email',__('Email'),array('class'=>'form-label'))}}
            {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter Email')))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('password',__('Password'),array('class'=>'form-label'))}}
            {{Form::password('password',array('class'=>'form-control','placeholder'=>__('Enter Password')))}}
        </div>
        <div class="form-group">
            {{Form::label('phone_number',__('Phone Number'),array('class'=>'form-label'))}}
            {{Form::text('phone_number',null,array('class'=>'form-control','placeholder'=>__('Enter Phone Number')))}}
        </div>
        <div class="form-group">
            {{Form::label('property_id',__('Property'),array('class'=>'form-label'))}}
            {{Form::select('property_id[]',$property,null,array('class'=>'form-control hidesearch','id'=>'property','multiple'))}}
        </div>

        <div class="form-group">
            {{Form::label('type_id',__('Type'),array('class'=>'form-label'))}}
            {{Form::select('type_id',$types,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group">
            {{Form::label('profile',__('Profile'),array('class'=>'form-label'))}}
            {{Form::file('profile',array('class'=>'form-control'))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}

<script>
    $(document).ready(function () {
        $("#create-maintainer-form").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password:{
                    required:true
                },
                phone_number: {
                    required: true
                },
                first_name:{
                    required:true
                },
                last_name:{
                    required:true
                },
                property_id:{
                    required:true
                },
                type_id:{
                    required:true
                }
            },
            messages: {
                email: {
                    required: "The email field is required",
                    email: "Enter a valid email address"
                },
                phone_number: {
                    required: "The phone number field is required"
                },
                first_name:{
                    required:"The first name field is required"
                },
                last_name:{
                    required:"The last name field is required"
                },
                password:{
                    required:"The password field is required"
                },
                property_id:{
                    required:"The property field is required"
                },
                type_id:{
                    required:"The type field is required"
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
