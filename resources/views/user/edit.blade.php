{{ Form::model($user, array('route' => array('users.update', $user->id), 'method' => 'PUT','id'=>'edit-user-form')) }}
<div class="modal-body">
    <div class="row">
        @if(\Auth::user()->type != 'super admin')
            <div class="form-group col-md-6">
                {{ Form::label('role', __('Assign Role'),['class'=>'form-label']) }}
                {!! Form::select('role', $userRoles, !empty($user->roles)?$user->roles[0]->id:null,array('class' => 'form-control hidesearch ','required'=>'required')) !!}
            </div>
        @endif
            @if(\Auth::user()->type == 'super admin')
                <div class="form-group col-md-6">
                    {{Form::label('name',__('Name'),array('class'=>'form-label')) }}
                    {{Form::text('name',null,array('class'=>'form-control','placeholder'=>__('Enter Name'),'required'=>'required'))}}
                </div>
            @else
                <div class="form-group col-md-6">
                    {{Form::label('first_name',__('First Name'),array('class'=>'form-label')) }}
                    {{Form::text('first_name',null,array('class'=>'form-control','placeholder'=>__('Enter First Name'),'required'=>'required'))}}
                </div>
                <div class="form-group col-md-6">
                    {{Form::label('last_name',__('Last Name'),array('class'=>'form-label')) }}
                    {{Form::text('last_name',null,array('class'=>'form-control','placeholder'=>__('Enter Name'),'required'=>'required'))}}
                </div>
            @endif
        <div class="form-group col-md-6">
            {{Form::label('email',__('User Email'),array('class'=>'form-label'))}}
            {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter User Email'),'required'=>'required'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('phone_number',__('User Phone Number'),array('class'=>'form-label')) }}
            {{Form::text('phone_number',null,array('class'=>'form-control','placeholder'=>__('Enter Phone Number')))}}
        </div>

    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Update'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#edit-user-form").validate({
            rules: {
                name:{
                    required:true
                },
                email: {
                    required: true,
                    email: true
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

