@extends('layouts.app')
@section('page-title')
    {{ __('Units') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a></li>
    <li class="breadcrumb-item" aria-current="page"> {{ __('Units') }}</li>
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
                            <h5>{{ __('Unit List') }}</h5>
                        </div>
                        @if (Gate::check('create unit'))
                            <div class="col-auto">
                                <a href="#" class="btn btn-secondary customModal" data-size="lg"
                                    data-url="{{ route('unit.direct-create') }}" data-title="{{ __('Create unit') }}"> <i
                                        class="ti ti-circle-plus align-text-bottom"></i> {{ __('Create Unit') }}</a>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div class="dt-responsive table-responsive">
                        <table class="table table-hover advance-datatable">
                            <thead>
                                <tr>
                                    <th>{{ __('Name') }}</th>
                                    <th>{{ __('Rent Type') }}</th>
                                    <th>{{ __('Rent') }}</th>
                                    <th>{{ __('Rent Duration') }}</th>
                                    <th>{{ __('Property') }}</th>
                                    <th>{{ __('Tenant') }}</th>
                                    @if (Gate::check('edit unit') || Gate::check('delete unit'))
                                        <th class="text-right">{{ __('Action') }}</th>
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($units as $unit)
                                    <tr>
                                        <td>{{ $unit->name }} </td>
                                        <td>{{ $unit->rent_type }} </td>
                                        <td>{{ priceFormat($unit->rent) }} </td>
                                        <td>
                                            @if ($unit->rent_type == 'custom')
                                                <span>{{ __('Start Date') }} :- </span>{{ dateFormat($unit->start_date) }}
                                                <br>
                                                <span>{{ __('End Date') }} :- </span>{{ dateFormat($unit->end_date) }}
                                                <br>
                                                <span>{{ __('Payment Due Date') }} :-
                                                </span>{{ dateFormat($unit->payment_due_date) }}
                                            @else
                                                {{ $unit->rent_duration }}
                                            @endif
                                        </td>
                                        <td>{{ !empty($unit->properties) ? $unit->properties->name : '-' }} </td>
                                        <td>{{ !empty($unit->tenants()) && !empty($unit->tenants()->user) ? $unit->tenants()->user->name : '-' }}
                                        </td>
                                        @if (Gate::check('edit unit') || Gate::check('delete unit'))
                                            <td class="text-right">
                                                <div class="cart-action">
                                                    {!! Form::open(['method' => 'DELETE', 'route' => ['unit.destroy', [$unit->property_id, $unit->id]]]) !!}

                                                    @can('edit unit')
                                                        <a class="text-secondary customModal"
                                                            data-url="{{ route('unit.edit', [$unit->property_id, $unit->id]) }}"
                                                            href="#" data-size="lg" data-title="{{ __('Edit Unit') }}"
                                                            data-bs-toggle="tooltip"
                                                            data-bs-original-title="{{ __('Edit') }}">
                                                            <i data-feather="edit"></i></a>
                                                    @endcan
                                                    @can('delete unit')
                                                        <a class=" text-danger confirm_dialog" data-bs-toggle="tooltip"
                                                            data-bs-original-title="{{ __('Detete') }}" href="#"> <i
                                                                data-feather="trash-2"></i></a>
                                                    @endcan
                                                    {!! Form::close() !!}
                                                </div>
                                            </td>
                                        @endif
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
