{{Form::model($page, array('route' => array('pages.update', $page->id), 'method' => 'PUT','id'=>'edit-page-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('title',__('Title'),array('class'=>'form-label'))}}
            {{Form::text('title',null,array('class'=>'form-control','placeholder'=>__('Enter Title')))}}
        </div>
        <div class="form-group col-md-12">
            {{ Form::label('enabled', __('Enabled Page'), ['class' => 'form-label']) }}
            {{ Form::hidden('enabled', 0, ['class' => 'form-check-input']) }}
            <div class="form-check form-switch">
                {{ Form::checkbox('enabled', 1, true, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'flexSwitchCheckChecked']) }}
                {{ Form::label('', '', ['class' => 'form-check-label']) }}
            </div>
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('content',__('Content'),array('class'=>'form-label'))}}
            {!! Form::textarea('content', null, ['class' => 'form-control', 'id' => 'classic-editor']) !!}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Update'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#edit-page-form").validate({
            rules: {
                title:{
                    required:true
                },
                content: {
                    required: true,
                }
            },
            messages: {
                title:{
                    required:"The title field is required"
                },
                content: {
                    required: "The content field is required",
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

