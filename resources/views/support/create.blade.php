{{Form::open(array('url'=>'support','method'=>'post', 'enctype' => "multipart/form-data",'id'=>"support-form"))}}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('subject',__('Subject'),array('class'=>'form-label'))}}
            {{Form::text('subject',null,array('class'=>'form-control','placeholder'=>__('Enter support subject')))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('priority',__('Priority'),array('class'=>'form-label'))}}
            {{Form::select('priority',$priority,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('attachment',__('Files'),array('class'=>'form-label'))}}
            {{Form::file('attachment',array('class'=>'form-control'))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('assign_user',__('User Assign'),array('class'=>'form-label'))}}
            {{Form::select('assign_user',$users,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('status',__('Status'),array('class'=>'form-label'))}}
            {{Form::select('status',$status,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group  col-md-12">
            {{Form::label('description',__('Comment'),array('class'=>'form-label'))}}
            {{Form::textarea('description',null,array('class'=>'form-control','rows'=>5))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#support-form").validate({
            rules: {
                subject:{
                    required:true,
                },
                priority:{
                    required:true
                },
                attachment:{
                    required:true
                },
                assign_user:{
                    required:true
                },
                status:{
                    required:true
                },
                description:{
                    required:true
                }
            },
            messages: {
                subject:{
                    required:"The subject field is required",
                },
                priority:{
                    required:"The priority field is required"
                },
                attachment:{
                    required:"The attachment field is required"
                },
                assign_user:{
                    required:"The user field is required"
                },
                status:{
                    required:"The status field is required"
                },
                description:{
                    required:"The description field is required"
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


