{{Form::open(array('url'=>'users','method'=>'post','id'=>'create-user-form'))}}
<div class="modal-body">
    <div class="row">
        @if(\Auth::user()->type != 'super admin')
            <div class="form-group col-md-6">
                {{ Form::label('role', __('Assign Role'),['class'=>'form-label']) }}
                {!! Form::select('role', $userRoles, null,array('class' => 'form-control basic-select','required'=>'required')) !!}
            </div>
        @endif
        @if(\Auth::user()->type == 'super admin')
            <div class="form-group col-md-6">
                {{Form::label('name',__('Name'),array('class'=>'form-label')) }}
                {{Form::text('name',null,array('class'=>'form-control','placeholder'=>__('Enter Name')))}}
            </div>
        @else
            <div class="form-group col-md-6">
                {{Form::label('first_name',__('First Name'),array('class'=>'form-label')) }}
                {{Form::text('first_name',null,array('class'=>'form-control','placeholder'=>__('Enter First Name')))}}
            </div>
            <div class="form-group col-md-6">
                {{Form::label('last_name',__('Last Name'),array('class'=>'form-label')) }}
                {{Form::text('last_name',null,array('class'=>'form-control','placeholder'=>__('Enter Name'),'required'=>'required'))}}
            </div>
        @endif
        <div class="form-group col-md-6">
            {{Form::label('email',__('User Email'),array('class'=>'form-label'))}}
            {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter user email')))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('password',__('User Password'),array('class'=>'form-label'))}}
            {{Form::password('password',array('class'=>'form-control','placeholder'=>__('Enter user password'),'minlength'=>"6"))}}

        </div>
        <div class="form-group col-md-6">
            {{Form::label('phone_number',__('User Phone Number'),array('class'=>'form-label')) }}
            {{Form::text('phone_number',null,array('class'=>'form-control','placeholder'=>__('Enter user phone number')))}}
        </div>

    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary ml-10'))}}
</div>
{{Form::close()}}
<script>
    $(document).ready(function () {
        $("#create-user-form").validate({
            rules: {
                name:{
                    required:true
                },
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                },
                phone_number: {
                    required: true
                },
                role:{
                    required:true
                },
                first_name:{
                    required:true
                },
                last_name:{
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
                password: {
                    required: "The password field is required",
                },
                phone_number: {
                    required: "The phone number field is required"
                },
                role:{
                    required:"The role field is required"
                },
                first_name:{
                    required:"The first name field is required"
                },
                last_name:{
                    required:"The last name field is required"
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

