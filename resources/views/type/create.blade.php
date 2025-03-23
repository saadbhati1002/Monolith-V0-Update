{{Form::open(array('url'=>'type','method'=>'post','id'=>'create-type-form'))}}
<div class="modal-body">
    <div class="form-group ">
        {{Form::label('title',__('Title'),array('class'=>'form-label'))}}
        {{Form::text('title',null,array('class'=>'form-control','placeholder'=>__('Enter Invoice / Expense / Maintainance Issue,Type Title')))}}
    </div>
    <div class="form-group">
        {{ Form::label('type', __('Type'),['class'=>'form-label']) }}
        {!! Form::select('type', $types, null,array('class' => 'form-control hidesearch','required'=>'required')) !!}
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#create-type-form").validate({
            rules: {
                title: {
                    required: true,
                },
                type:{
                    required:true
                }
            },
            messages: {
                title: {
                    required: "The title field is required",
                },
                type:{
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


