@extends('layouts.app')
@php
    $profile = asset(Storage::url('upload/profile/'));
@endphp
@section('page-title')
    @if (\Auth::user()->type == 'super admin')
        {{ __('Customer') }}
    @else
        {{ __('User') }}
    @endif
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a>
    </li>
    <li class="breadcrumb-item" aria-current="page">
        @if (\Auth::user()->type == 'super admin')
            {{ __('Customers') }}
        @else
            {{ __('Users') }}
        @endif
    </li>
@endsection
@push('script-page')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
@endpush
@section('content')
    <div class="row">
        <div class="col-sm-12">


            <div class="card table-card">
                <div class="card-header">
                    <div class="row align-items-center g-2">
                        <div class="col">
                            <h5> @if (\Auth::user()->type == 'super admin')
                                {{ __('Customer List') }}
                            @else
                                {{ __('User List') }}
                            @endif</h5>
                        </div>
                        @if (Gate::check('create user'))
                            <div class="col-auto">
                                <a href="#" class="btn btn-secondary customModal" data-size="lg"
                                    data-url="{{ route('users.create') }}" data-title="{{ __('Create User') }}"> <i
                                        class="ti ti-circle-plus align-text-bottom"></i> {{ __('Create User') }}</a>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div class="dt-responsive table-responsive">
                        <table class="table table-hover advance-datatable">
                            <thead>
                                <tr>
                                    <th>{{ __('User') }}</th>
                                    <th>{{ __('Email') }}</th>
                                    <th>{{ __('Phone Number') }}</th>
                                    @if (\Auth::user()->type == 'super admin')
                                        <th>{{ __('Active Package') }}</th>
                                        <th>{{ __('Package Due Date') }}</th>
                                    @else
                                        <th>{{ __('Assign Role') }}</th>
                                    @endif
                                    <th>{{ __('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td class="table-user">
                                            <img src="{{ !empty($user->avatar) ? asset(Storage::url('upload/profile')) . '/' . $user->avatar : asset(Storage::url('upload/profile')) . '/avatar.png' }}"
                                                alt="" class="mr-2 avatar-sm rounded-circle user-avatar">
                                            <a href="#"
                                                class="text-body font-weight-semibold">{{ $user->name }}</a>
                                        </td>
                                        <td>{{ $user->email }} </td>
                                        <td>{{ !empty($user->phone_number) ? $user->phone_number : '-' }} </td>
                                        @if (\Auth::user()->type == 'super admin')
                                            <td>{{ !empty($user->subscriptions) ? $user->subscriptions->title : '-' }}
                                            </td>
                                            <td>{{ !empty($user->plan_expire_date) ? dateFormat($user->plan_expire_date) : __('Unlimited') }}
                                            </td>
                                        @else
                                            <td>{{ ucfirst($user->type) }} </td>
                                        @endif
                                        <td>
                                            <div class="cart-action">
                                                {!! Form::open(['method' => 'DELETE', 'route' => ['users.destroy', $user->id]]) !!}

                                                @can('show user')
                                                    <a class="text-warning" data-bs-toggle="tooltip"
                                                        data-bs-original-title="{{ __('Show') }}"
                                                        href="{{ route('users.show', $user->id) }}"
                                                        data-title="{{ __('Edit User') }}"> <i data-feather="eye"></i></a>
                                                @endcan
                                                @can('edit user')
                                                    <a class="text-secondary customModal" data-bs-toggle="tooltip"
                                                        data-size="lg" data-bs-original-title="{{ __('Edit') }}"
                                                        href="#" data-url="{{ route('users.edit', $user->id) }}"
                                                        data-title="{{ __('Edit User') }}"> <i data-feather="edit"></i></a>
                                                @endcan
                                                @can('delete user')
                                                    <a class=" text-danger confirm_dialog" data-bs-toggle="tooltip"
                                                        data-bs-original-title="{{ __('Detete') }}" href="#"> <i
                                                            data-feather="trash-2"></i></a>
                                                @endcan

                                                @if (Auth::user()->canImpersonate())
                                                    <a class=" text-info" data-bs-toggle="tooltip"
                                                        data-bs-original-title="{{ __('Continue as Customer') }}"
                                                        href="{{ route('impersonate', $user->id) }}"> <i
                                                            data-feather="log-in"></i></a>
                                                @endif

                                                {!! Form::close() !!}
                                            </div>

                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
