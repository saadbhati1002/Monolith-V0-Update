@extends('layouts.app')
@section('page-title')
    {{ __('System Settings') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a></li>
    <li class="breadcrumb-item" aria-current="page"> {{ __('System Settings') }}</li>
@endsection
@php
    $profile = asset(Storage::url('upload/profile'));
    $settings = settings();
    $activeTab = session('tab', 'footer_column_1');
@endphp
@push('script-page')
    <script>
        $(document).ready(function() {
            var activeTab = '#' + '{{ $activeTab }}';

            if($(activeTab).length == 0) {
                activeTab = $('.setting_page_cnt a.nav-link').eq(0).attr('href');
            }
            $('.setting_page_cnt a.nav-link').removeClass('active');
            $(".setting_page_cnt .tab-pane").removeClass('active show');
            $('.setting_page_cnt a[href="' + activeTab + '"]').addClass('active');
            $(activeTab).addClass('active show');
        });
    </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<script>
   
    $(document).ready(function () {
        $("#footer-column-1-form").validate({
            rules: {
                footer_column_1: {
                    required: true,
                },
                footer_column_1_pages: {
                    required: true,
                },
            },
            messages: {
                footer_column_1: {
                    required: "The footer column 1 field is required",
                },
                footer_column_1_pages: {
                    required: "The footer column 1 page field is required",
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

<script>
    $(document).ready(function () {
        $("#footer-column-2-form").validate({
            rules: {
                footer_column_2: {
                    required: true,
                },
                footer_column_2_pages: {
                    required: true,
                },
            },
            messages: {
                footer_column_2: {
                    required: "The footer column 2 field is required",
                },
                footer_column_2_pages: {
                    required: "The footer column 2 page field is required",
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

<script>
    $(document).ready(function () {
        $("#footer-column-3-form").validate({
            rules: {
                footer_column_3: {
                    required: true,
                },
                footer_column_3_pages: {
                    required: true,
                },
            },
            messages: {
                footer_column_3: {
                    required: "The footer column 3 field is required",
                },
                footer_column_3_pages: {
                    required: "The footer column 3 page field is required",
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

<script>
    $(document).ready(function () {
        $("#footer-column-4-form").validate({
            rules: {
                footer_column_4: {
                    required: true,
                },
                footer_column_4_pages: {
                    required: true,
                },
            },
            messages: {
                footer_column_4: {
                    required: "The footer column 4 field is required",
                },
                footer_column_4_pages: {
                    required: "The footer column 4 page field is required",
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
@endpush
@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="card">

                <div class="card-body">
                    <div class="row setting_page_cnt">
                        <div class="col-lg-4">
                            <ul class="nav flex-column nav-tabs account-tabs mb-3" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="profile-tab-1" data-bs-toggle="tab"
                                        href="#footer_column_1" role="tab" aria-selected="true">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0">
                                                <i class="ti-view-list me-2 f-20"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2">
                                                <h5 class="mb-0">{{ $settings['footer_column_1'] }}</h5>
                                                <small class="text-muted">{{ __('Footer Column 1 Settings') }}</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab-2" data-bs-toggle="tab" href="#footer_column_2"
                                        role="tab" aria-selected="true">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0">
                                                <i class="ti-view-list me-2 f-20"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2">
                                                <h5 class="mb-0">{{ $settings['footer_column_2'] }}</h5>
                                                <small class="text-muted">{{ __('Footer Column 2 Settings') }}</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab-3" data-bs-toggle="tab" href="#footer_column_3"
                                        role="tab" aria-selected="true">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0">
                                                <i class="ti-view-list me-2 f-20"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2">
                                                <h5 class="mb-0">{{ $settings['footer_column_3'] }}</h5>
                                                <small class="text-muted">{{ __('Footer Column 3 Settings') }}</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab-4" data-bs-toggle="tab" href="#footer_column_4"
                                        role="tab" aria-selected="true">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0">
                                                <i class="ti-view-list me-2 f-20"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-2">
                                                <h5 class="mb-0">{{ $settings['footer_column_4'] }}</h5>
                                                <small class="text-muted">{{ __('Footer Column 4 Settings') }}</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-8">
                            @if (Gate::check('edit footer'))
                                <div class="tab-content">
                                    <div class="tab-pane" id="footer_column_1" role="tabpanel"
                                        aria-labelledby="footer_column_1">
                                        {{ Form::model($loginUser, ['route' => ['setting.footer'], 'method' => 'post','id'=>'footer-column-1-form']) }}
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_1', __('Name'), ['class' => 'form-label']) }}
                                                    {{ Form::text('footer_column_1', $settings['footer_column_1'], ['class' => 'form-control', 'placeholder' => __('Enter your name'), 'required' => 'required']) }}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('email', __('Page'), ['class' => 'form-label']) }}
                                                    {!! Form::select(
                                                        'footer_column_1_pages[]',
                                                        $pages,
                                                        !empty($settings['footer_column_1_pages']) ? json_decode($settings['footer_column_1_pages'], true) : null,
                                                        ['class' => 'form-control hidesearch', 'multiple'],
                                                    ) !!}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    {{ Form::label('enabled_email', __('Footer Column 1 Enabled'), ['class' => 'form-label']) }}
                                                    <div class="form-check form-switch">
                                                        {{ Form::hidden('footer_column_1_enabled', 'deactive') }}
                                                        {{ Form::checkbox('footer_column_1_enabled', 'active', !empty($settings['footer_column_1_enabled']) && $settings['footer_column_1_enabled'] == 'active' ? true : false, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'footer_column_1_enabled']) }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-6"></div>
                                            <div class="col-6 text-end">
                                                <input type="hidden" name="tab" value="footer_column_1">
                                                {{ Form::submit(__('Save'), ['class' => 'btn btn-secondary btn-rounded']) }}
                                            </div>
                                        </div>
                                        {{ Form::close() }}
                                    </div>

                                    <div class="tab-pane " id="footer_column_2" role="tabpanel"
                                        aria-labelledby="footer_column_2">
                                        {{ Form::model($loginUser, ['route' => ['setting.footer'], 'method' => 'post','id'=>'footer-column-2-form']) }}
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_2', __('Name'), ['class' => 'form-label']) }}
                                                    {{ Form::text('footer_column_2', $settings['footer_column_2'], ['class' => 'form-control', 'placeholder' => __('Enter your name'), 'required' => 'required']) }}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('email', __('Page'), ['class' => 'form-label']) }}
                                                    {!! Form::select(
                                                        'footer_column_2_pages[]',
                                                        $pages,
                                                        !empty($settings['footer_column_2_pages']) ? json_decode($settings['footer_column_2_pages'], true) : null,
                                                        ['class' => 'form-control hidesearch', 'multiple'],
                                                    ) !!}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_2_enabled', __('Footer Column 2 Enabled'), ['class' => 'form-label']) }}
                                                    <div class="form-check form-switch">
                                                        {{ Form::hidden('footer_column_2_enabled', 'deactive') }}
                                                        {{ Form::checkbox('footer_column_2_enabled', 'active', !empty($settings['footer_column_2_enabled']) && $settings['footer_column_2_enabled'] == 'active' ? true : false, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'footer_column_2_enabled']) }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-6"></div>
                                            <div class="col-6 text-end">
                                                <input type="hidden" name="tab" value="footer_column_2">
                                                {{ Form::submit(__('Save'), ['class' => 'btn btn-secondary btn-rounded']) }}
                                            </div>
                                        </div>
                                        {{ Form::close() }}
                                    </div>

                                    <div class="tab-pane " id="footer_column_3" role="tabpanel"
                                        aria-labelledby="footer_column_3">
                                        {{ Form::model($loginUser, ['route' => ['setting.footer'], 'method' => 'post','id'=>'footer-column-3-form']) }}
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_3', __('Name'), ['class' => 'form-label']) }}
                                                    {{ Form::text('footer_column_3', $settings['footer_column_3'], ['class' => 'form-control', 'placeholder' => __('Enter your name'), 'required' => 'required']) }}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('email', __('Page'), ['class' => 'form-label']) }}
                                                    {!! Form::select(
                                                        'footer_column_3_pages[]',
                                                        $pages,
                                                        !empty($settings['footer_column_3_pages']) ? json_decode($settings['footer_column_3_pages'], true) : null,
                                                        ['class' => 'form-control hidesearch', 'multiple'],
                                                    ) !!}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_3_enabled', __('Footer Column 3 Enabled'), ['class' => 'form-label']) }}
                                                    <div class="form-check form-switch">
                                                        {{ Form::hidden('footer_column_3_enabled', 'deactive') }}
                                                        {{ Form::checkbox('footer_column_3_enabled', 'active', !empty($settings['footer_column_3_enabled']) && $settings['footer_column_3_enabled'] == 'active' ? true : false, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'footer_column_3_enabled']) }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-6"></div>
                                            <div class="col-6 text-end">
                                                <input type="hidden" name="tab" value="footer_column_3">
                                                {{ Form::submit(__('Save'), ['class' => 'btn btn-secondary btn-rounded']) }}
                                            </div>
                                        </div>
                                        {{ Form::close() }}
                                    </div>

                                    <div class="tab-pane " id="footer_column_4" role="tabpanel"
                                        aria-labelledby="footer_column_4">
                                        {{ Form::model($loginUser, ['route' => ['setting.footer'], 'method' => 'post','id'=>'footer-column-4-form']) }}
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_4', __('Name'), ['class' => 'form-label']) }}
                                                    {{ Form::text('footer_column_4', $settings['footer_column_4'], ['class' => 'form-control', 'placeholder' => __('Enter your name'), 'required' => 'required']) }}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {{ Form::label('email', __('Page'), ['class' => 'form-label']) }}
                                                    {!! Form::select(
                                                        'footer_column_4_pages[]',
                                                        $pages,
                                                        !empty($settings['footer_column_4_pages']) ? json_decode($settings['footer_column_4_pages'], true) : null,
                                                        ['class' => 'form-control hidesearch', 'multiple'],
                                                    ) !!}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    {{ Form::label('footer_column_4_enabled', __('Footer Column 4 Enabled'), ['class' => 'form-label']) }}
                                                    <div class="form-check form-switch">
                                                        {{ Form::hidden('footer_column_4_enabled', 'deactive') }}
                                                        {{ Form::checkbox('footer_column_4_enabled', 'active', !empty($settings['footer_column_4_enabled']) && $settings['footer_column_4_enabled'] == 'active' ? true : false, ['class' => 'form-check-input', 'role' => 'switch', 'id' => 'footer_column_4_enabled']) }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-6"></div>
                                            <div class="col-6 text-end">
                                                <input type="hidden" name="tab" value="footer_column_4">
                                                {{ Form::submit(__('Save'), ['class' => 'btn btn-secondary btn-rounded']) }}
                                            </div>
                                        </div>
                                        {{ Form::close() }}
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
