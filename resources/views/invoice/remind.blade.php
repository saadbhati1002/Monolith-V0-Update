{{ Form::model($notification, ['route' => ['invoice.sendEmail', $id], 'method' => 'post','id'=>'reminder-form']) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-6">
            {{ Form::label('name', __('Module'), ['class' => 'form-label']) }}
            {!! Form::text('name', null,[
                'class' => 'form-control',
                'required' => 'required',
                'readonly' => 'readonly',
            ]) !!}
        </div>

        <div class="form-group col-md-6">
            {{ Form::label('subject', __('Subject'), ['class' => 'form-label']) }}
            {{ Form::text('subject', null, ['class' => 'form-control', 'placeholder' => __('Enter Subject'), 'required' => 'required']) }}
        </div>

        <div class="form-group col-md-12">
            {{ Form::label('message', __('User Message'), ['class' => 'form-label']) }}
            {!! Form::textarea('message', $notification->message, [
                'class' => 'form-control',
                'rows' => 5,
                'id' => 'message',
            ]) !!}

        </div>

        <div class="form-group col-md-12">
            <h4 class="mb-0">{{ __('Shortcodes') }}</h4>
            <p>{{ __('Click to add below shortcodes and insert in your Message') }}</p>

            @php
                $i = 0; // Counter for determining the display state of sections
            @endphp

            @if (!empty($notification->short_code) && is_array($notification->short_code))
                <section class="sortcode_var" style="display: {{ $i == 0 ? 'block' : 'none' }};">
                    @foreach ($notification->short_code as $item)
                        <a href="javascript:void(0);">
                            <span class="badge badge-primary sort_code_click m-2" data-val="{{ $item }}">
                                {{ $item }}
                            </span>
                        </a>
                    @endforeach
                </section>
            @else
                <p>{{ __('No shortcodes available for this notification.') }}</p>
            @endif
        </div>


    </div>
</div>
<div class="modal-footer">
    {{ Form::submit(__('Send Mail'), ['class' => 'btn btn-secondary ml-10']) }}
</div>
{{ Form::close() }}


<script>
    $(document).ready(function() {
        $('.module').trigger('change');

    });


    $(document).on('change', '.module', function() {
        var modd = $('.module').val();
        $('.sortcode_var').hide();
        $('.sortcode_var.' + modd).show();

        var subject = $('.sortcode_tm.' + modd).attr('data-subject');
        $('.subject').val(subject);

        var templete = $('.sortcode_tm.' + modd).attr('data-templete');
        $('#message').html(templete);
    });



    var CKEDITORsd = ClassicEditor
        .create(document.querySelector('#message'), {}).then(editor => {
            window.editor = editor;
            editorInstance = editor;

            $(document).on('click', '.sort_code_click', function() {
                var val = $(this).attr('data-val');
                editor.model.change(writer => {
                    const viewFragment = editor.data.processor.toView(val);
                    const modelFragment = editor.data.toModel(viewFragment);
                    editor.model.insertContent(modelFragment);
                });
            });

            $(document).on('change', '.module', function() {
                var modd = $('.module').val();
                var templete = $('.sortcode_tm.' + modd).attr('data-templete');
                editorInstance.setData(templete);
            });
        })
        .catch(error => {
            console.log(error);
        });
</script>
<script>
    $(document).ready(function () {
        $("#reminder-form").validate({
            rules: {
                name: {
                    required: true,
                },
                subject:{
                    required:true
                },
                message:{
                    required:true
                }
            },
            messages: {
                name: {
                    required: "The name field is required",
                },
                subject:{
                    required:"The subject field is required"
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
