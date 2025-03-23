{{ Form::open(array('url' => 'permission','id'=>'permission-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group ">
            {{Form::label('title',__('Permission Title'),['class'=>'form-label '])}}
            {{Form::text('title',null,array('class'=>'form-control'))}}
        </div>
        <div class="form-group">
            {{ Form::label('user_roles', __('User Roles'),['class'=>'form-label']) }}
            {!! Form::select('user_roles[]', $userRoles, null,array('class' => 'form-control hidesearch','multiple','required'=>'required')) !!}
        </div>
        <div class="col-md-12">
            {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
        </div>
    </div>
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#permission-form").validate({
            rules: {
                title:{
                    required:true,
                },
                user_roles:{
                    required:true
                },
            },
            messages: {
                title:{
                    required:"The title field is required",
                },
                user_roles:{
                    required:"The role field is required"
                },
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


