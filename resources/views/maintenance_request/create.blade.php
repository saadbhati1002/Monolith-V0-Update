@php
$user=\Auth::user();
$tenant=$user->tenants;
@endphp
{{Form::open(array('url'=>'maintenance-request','method'=>'post', 'enctype' => "multipart/form-data",'id'=>'create-maintenance-request-form'))}}
<div class="modal-body">
    <div class="row">
        @if($user->type=='tenant')
            {{Form::hidden('property_id',!empty($tenant)?$tenant->property:null,array('class'=>'form-control'))}}
            {{Form::hidden('unit_id',!empty($tenant)?$tenant->unit:null,array('class'=>'form-control'))}}
        @else
            <div class="form-group col-md-6 col-lg-6">
                {{Form::label('property_id',__('Property'),array('class'=>'form-label'))}}
                {{Form::select('property_id',$property,null,array('class'=>'form-control hidesearch','id'=>'property_id'))}}
            </div>
            <div class="form-group col-lg-6 col-md-6">
                {{Form::label('unit_id',__('Unit'),array('class'=>'form-label'))}}
                <div class="unit_div">
                    <select class="form-control hidesearch unit" id="unit_id" name="unit_id">
                        <option value="">{{__('Select Unit')}}</option>
                    </select>
                </div>
            </div>
        @endif

        <div class="form-group  col-md-6 col-lg-6">
            {{Form::label('request_date',__('Request Date'),array('class'=>'form-label'))}}
            {{Form::date('request_date',null,array('class'=>'form-control'))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('maintainer_id',__('Maintainer'),array('class'=>'form-label'))}}
            {{Form::select('maintainer_id',$maintainers,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('issue_type',__('Issue Type'),array('class'=>'form-label'))}}
            {{Form::select('issue_type',$types,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group col-md-6 col-lg-6">
            {{Form::label('status',__('Status'),array('class'=>'form-label'))}}
            {{Form::select('status',$status,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group  col-md-12 col-lg-12">
            {{Form::label('issue_attachment',__('Issue Attachment'),array('class'=>'form-label'))}}
            {{Form::file('issue_attachment',array('class'=>'form-control'))}}
        </div>
        <div class="form-group  col-md-12 col-lg-12">
            {{Form::label('notes',__('Notes'),array('class'=>'form-label'))}}
            {{Form::textarea('notes',null,array('class'=>'form-control','rows'=>3))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    {{Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $('#property_id').on('change', function () {
        "use strict";
        var property_id=$(this).val();
        var url = '{{ route("property.unit", ":id") }}';
        url = url.replace(':id', property_id);
        $.ajax({
            url: url,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
                property_id:property_id,
            },
            contentType: false,
            processData: false,
            type: 'GET',
            success: function (data) {
                $('.unit').empty();
                var unit = `<select class="form-control hidesearch unit" id="unit_id" name="unit_id"></select>`;
                $('.unit_div').html(unit);

                $.each(data, function(key, value) {
                    $('.unit').append('<option value="' + key + '">' + value +'</option>');
                });
                $(".hidesearch").each(function() {
                    var basic_select = new Choices(this, {
                        searchEnabled: false,
                        removeItemButton: true,
                    });
                });
            },

        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#create-maintenance-request-form").validate({
            rules: {
                property_id: {
                    required: true,
                },
                unit_id:{
                    required:true
                },
                request_date: {
                    required: true
                },
                maintainer_id:{
                    required:true
                },
                issue_type:{
                    required:true
                },
                status:{
                    required:true
                },
                issue_attachment:{
                    required:true
                },
                notes:{
                    required:true
                }
            },
            messages: {
                property_id: {
                    required: "The property field required",
                },
                unit_id:{
                    required:"The unit field required"
                },
                request_date: {
                    required: "The request date field required"
                },
                maintainer_id:{
                    required:"The maintainer field required"
                },
                issue_type:{
                    required:"The issue type field required"
                },
                status:{
                    required:"The status field required"
                },
                issue_attachment:{
                    required:"The issue attachment field required"
                },
                notes:{
                    required:"The notes field required"
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

