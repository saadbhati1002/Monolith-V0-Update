
{{Form::open(array('url'=>'FAQ','method'=>'post','id'=>'create-faq-form'))}}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('question',__('Question'),array('class'=>'form-label'))}}
            {{Form::text('question',null,array('class'=>'form-control','placeholder'=>__('Enter Question')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('description',__('Description'),array('class'=>'form-label'))}}
            {{Form::textarea('description',null,array('class'=>'form-control','rows'=>5))}}
        </div>
        <div class="form-group col-md-12">
            {{ Form::label('enabled', __('Enabled FAQ'), ['class' => 'form-label']) }}
            {{ Form::hidden('enabled', 0, ['class' => 'form-check-input']) }}
            <div class="form-check form-switch">
                {{ Form::checkbox('enabled', 1, true, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'flexSwitchCheckChecked']) }}
                {{ Form::label('', '', ['class' => 'form-check-label']) }}
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-primary btn-rounded'))}}
</div>
{{ Form::close() }}

<script>
    $(document).ready(function () {
        $("#create-faq-form").validate({
            rules: {
                question:{
                    required:true
                },
                description: {
                    required: true,
                }
            },
            messages: {
                question:{
                    required:"The question field is required"
                },
                description: {
                    required: "The description field is required",
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


