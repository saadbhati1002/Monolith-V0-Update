@extends('layouts.app')
@section('page-title')
    {{ __('Contact Diary') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a></li>
    <li class="breadcrumb-item" aria-current="page"> {{ __('Contact Diary') }}</li>
@endsection
@push('script-page')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
@endpush
@section('content')

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">
                    <div class="row align-items-center g-2">
                        <div class="col">
                            <h5>{{ __('Contact List') }}</h5>
                        </div>
                        @if (Gate::check('create contact'))
                            <div class="col-auto">
                                <a href="#" class="btn btn-secondary customModal" data-size="md"
                                    data-url="{{ route('contact.create') }}" data-title="{{ __('Create Contact') }}"> <i
                                        class="ti ti-circle-plus align-text-bottom"></i> {{ __('Create Contact') }}</a>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        @foreach ($contacts as $contact)
                            <div class="col-xxl-3 col-xl-4 col-md-6">
                                <div class="card follower-card">
                                    <div class="card-body p-3">
                                        @if (Gate::check('edit contact') || Gate::check('delete contact'))
                                            <div class="d-flex align-items-start mb-3">
                                                <div class="flex-grow-1 mx-2"></div>
                                                <div class="flex-shrink-0">
                                                    <div class="dropdown">
                                                        <a class="dropdown-toggle text-primary opacity-50 arrow-none"
                                                            href="#" data-bs-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                            <i class="ti ti-dots f-16"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-end">
                                                            @if (Gate::check('edit contact'))
                                                                <a class="dropdown-item customModal" href="#" data-url="{{ route('contact.edit', $contact->id) }}"
                                                                    data-title="{{ __('Edit Contact') }}">   <i class="ti ti-edit"></i>{{ __('Edit') }}</a>

                                                            @endif
                                                            @if (Gate::check('delete contact'))
                                                            {!! Form::open(['method' => 'DELETE', 'route' => ['contact.destroy', $contact->id],'id'=>'user-'.$contact->id]) !!}
                                                                <a href="#" class="dropdown-item confirm_dialog"><i class="ti ti-trash"></i> {{__('Delete')}}</a>
                                                                {!! Form::close() !!}


                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endif
                                        <h3 class="mb-1 text-truncate">{{ $contact->name }}</h3>
                                        <h6 class="text-truncate text-muted d-flex align-items-center mb-4">
                                            {{ $contact->email }}
                                        </h6>
                                        <div class="row">
                                            <div class="col-sm-6 mb-4">
                                                <p class="mb-0 text-muted text-sm">{{ __('Contact Number') }}</p>
                                                <h6 class="mb-0">{{ $contact->contact_number }} </h6>
                                            </div>
                                            <div class="col-sm-6 mb-4">
                                                <p class="mb-0 text-muted text-sm">{{ __('Created Date') }}</p>
                                                <h6 class="mb-0">{{ dateFormat($contact->created_at) }}</h6>
                                            </div>
                                            <div class="col-12 mb-4">
                                                <p class="mb-0 text-muted text-sm">{{ __('Subject') }}</p>
                                                <h6 class="mb-0">{{ $contact->subject }}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
