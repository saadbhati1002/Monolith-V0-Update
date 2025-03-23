{{ Form::model($subscription, array('route' => array('subscriptions.update', $subscription->id), 'method' => 'PUT','id'=>'edit-subscription-form')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group">
            {{Form::label('title',__('Title'),array('class'=>'form-label'))}}
            {{Form::text('title',null,array('class'=>'form-control','placeholder'=>__('Enter subscription title'),'required'=>'required'))}}
        </div>
        <div class="form-group">
            {{ Form::label('interval', __('Interval'),array('class'=>'form-label')) }}
            {!! Form::select('interval', $intervals, null,array('class' => 'form-control hidesearch','required'=>'required')) !!}
        </div>
        <div class="form-group">
            {{Form::label('package_amount',__('Package Amount'),array('class'=>'form-label'))}}
            {{Form::number('package_amount',null,array('class'=>'form-control','placeholder'=>__('Enter package amount'),'step'=>'0.01'))}}
        </div>
        <div class="form-group">
            {{Form::label('user_limit',__('User Limit'),array('class'=>'form-label'))}}
            {{Form::number('user_limit',null,array('class'=>'form-control','placeholder'=>__('Enter user limit'),'required'=>'required'))}}
        </div>
        <div class="form-group">
            {{Form::label('property_limit',__('Property Limit'),array('class'=>'form-label'))}}
            {{Form::number('property_limit',null,array('class'=>'form-control','placeholder'=>__('Enter property limit'),'required'=>'required'))}}
        </div>
        <div class="form-group">
            {{Form::label('tenant_limit',__('Tenant Limit'),array('class'=>'form-label'))}}
            {{Form::number('tenant_limit',null,array('class'=>'form-control','placeholder'=>__('Enter tenant limit'),'required'=>'required'))}}
        </div>
        <div class="form-group col-md-6">
            <div class="form-check form-switch custom-switch-v1 mb-2">
                <input type="checkbox" class="form-check-input input-secondary" name="enabled_logged_history" id="enabled_logged_history" {{$subscription->enabled_logged_history==1?'checked':''}}>
                {{Form::label('enabled_logged_history',__('Show User Logged History'),array('class'=>'form-label'))}}
              </div>
        </div>

    </div>
</div>
<div class="modal-footer">

    {{Form::submit(__('Update'),array('class'=>'btn btn-secondary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $(document).ready(function () {
        $("#edit-subscription-form").validate({
            rules: {
                title:{
                    required:true
                },
                interval: {
                    required: true,
                },
                package_amount:{
                    required:true
                },
                user_limit:{
                    required:true
                },
                property_limit:{
                    required:true
                },
                tenant_limit:{
                    required:true
                }
            },
            messages: {
                title:{
                    required:"The title field is required"
                },
                interval: {
                    required: "The interval field is required",
                },
                package_amount:{
                    required:"The package amount field is required"
                },
                user_limit:{
                    required:"The user limit field is required"
                },
                property_limit:{
                    required:"The property limit field is required"
                },
                tenant_limit:{
                    required:"The tenant limit field is required"
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


