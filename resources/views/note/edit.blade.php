{{Form::model($note, array('route' => array('note.update', $note->id), 'method' => 'PUT','enctype' => "multipart/form-data",'id'=>'edit-role-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('title',__('Title'),array('class'=>'form-label'))}}
            {{Form::text('title',null,array('class'=>'form-control','placeholder'=>__('Enter note title')))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('attachment',__('Attachment'),array('class'=>'form-label'))}}
            {{Form::file('attachment',array('class'=>'form-control'))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('description',__('Description'),array('class'=>'form-label'))}}
            {{Form::textarea('description',null,array('class'=>'form-control','rows'=>5))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Update'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#edit-role-form").validate({
            rules: {
                title:{
                    required:true
                },
                description: {
                    required: true,
                }
            },
            messages: {
                title:{
                    required:"The title field is required"
                },
                description: {
                    required: "The description field is required",
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


