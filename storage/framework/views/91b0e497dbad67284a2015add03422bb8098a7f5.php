<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Invoice')); ?>

<?php $__env->stopSection(); ?>
<?php
    $admin_logo = getSettingsValByName('company_logo');
    $settings = settings();

?>


<?php $__env->startPush('script-page'); ?>
    <script src="<?php echo e(asset('assets/js/vendors/ckeditor/ckeditor.js')); ?>"></script>
    <script>
        setTimeout(() => {
            feather.replace();
        }, 500);
    </script>
<?php $__env->stopPush(); ?>


<?php $__env->startPush('script-page'); ?>
    <script>
        $(document).on('click', '.print', function() {
            var printContents = document.getElementById('invoice-print').innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;

        });
    </script>
    <script src="https://js.stripe.com/v3/"></script>

    <script type="text/javascript">
        <?php if(
            $invoicePaymentSettings['STRIPE_PAYMENT'] == 'on' &&
                !empty($invoicePaymentSettings['STRIPE_KEY']) &&
                !empty($invoicePaymentSettings['STRIPE_SECRET'])): ?>
            var stripe_key = Stripe('<?php echo e($invoicePaymentSettings['STRIPE_KEY']); ?>');
            var stripe_elements = stripe_key.elements();
            var strip_css = {
                base: {
                    fontSize: '14px',
                    color: '#32325d',
                },
            };
            var stripe_card = stripe_elements.create('card', {
                style: strip_css
            });
            stripe_card.mount('#card-element');

            var stripe_form = document.getElementById('stripe-payment');
            stripe_form.addEventListener('submit', function(event) {
                event.preventDefault();

                stripe_key.createToken(stripe_card).then(function(result) {
                    if (result.error) {
                        $("#stripe_card_errors").html(result.error.message);
                        $.NotificationApp.send("Error", result.error.message, "top-right",
                            "rgba(0,0,0,0.2)", "error");
                    } else {
                        var token = result.token;
                        var stripeForm = document.getElementById('stripe-payment');
                        var stripeHiddenData = document.createElement('input');
                        stripeHiddenData.setAttribute('type', 'hidden');
                        stripeHiddenData.setAttribute('name', 'stripeToken');
                        stripeHiddenData.setAttribute('value', token.id);
                        stripeForm.appendChild(stripeHiddenData);
                        stripeForm.submit();
                    }
                });
            });
        <?php endif; ?>
    </script>

    <script src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
    <script>
        <?php if(
            $invoicePaymentSettings['flutterwave_payment'] == 'on' &&
                !empty($invoicePaymentSettings['flutterwave_public_key']) &&
                !empty($invoicePaymentSettings['flutterwave_secret_key'])): ?>

            $(document).on("click", "#flutterwavePaymentBtn", function() {
                var amount = $('.amount').val();
                var flutterwaveCallbackURL = "<?php echo e(url('invoice/flutterwave')); ?>";
                var tx_ref = "RX1_" + Math.floor((Math.random() * 1000000000) + 1);
                var customer_email = '<?php echo e(\Auth::user()->email); ?>';
                var flutterwave_public_key = '<?php echo e($invoicePaymentSettings['flutterwave_public_key']); ?>';
                var nowTim = "<?php echo e(date('d-m-Y-h-i-a')); ?>";
                var currency = '<?php echo e($invoicePaymentSettings['CURRENCY']); ?>';

                if (amount) {
                    var flutterwavePayment = getpaidSetup({
                        txref: tx_ref,
                        PBFPubKey: flutterwave_public_key,
                        amount: amount,
                        currency: currency,
                        customer_email: customer_email,
                        meta: [{
                            metaname: "payment_id",
                            metavalue: "id"
                        }],
                        onclose: function() {},
                        callback: function(result) {
                            var txRef = result.tx.txRef;
                            var redirectUrl = flutterwaveCallbackURL + '/' +
                                '<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($invoice->id)); ?>' +
                                '/' + txRef;
                            if (result.tx.chargeResponseCode == "00" || result.tx.chargeResponseCode ==
                                "0") {
                                window.location.href = redirectUrl;
                            } else {
                                alert('Payment failed');
                            }
                            flutterwavePayment.close();
                        }
                    });
                } else {
                    alert('Please enter a valid amount');
                }
            });
        <?php endif; ?>
    </script>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <ul class="breadcrumb mb-0">
        <li class="breadcrumb-item">
            <a href="<?php echo e(route('dashboard')); ?>">
                <?php echo e(__('Dashboard')); ?>

            </a>
        </li>
        <li class="breadcrumb-item">
            <a href="<?php echo e(route('invoice.index')); ?>"><?php echo e(__('Invoice')); ?></a>
        </li>
        <li class="breadcrumb-item active">
            <a href="#"><?php echo e(__('Details')); ?></a>
        </li>
    </ul>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>




    <div class="row">


        <div class="<?php echo e($invoice->getInvoiceDueAmount() > 0 ? 'col-lg-8 col-md-12' : 'col-lg-12 col-md-12'); ?>">
            <div>

                <div class="card">

                    <div class="card-header">
                        <ul class="list-inline ms-auto mb-0 d-flex justify-content-end flex-wrap">

                            <?php if(\Auth::user()->type == 'owner'): ?>
                                <?php if($invoice->getInvoiceDueAmount() > 0): ?>
                                    <li class="list-inline-item align-bottom me-2">
                                        <a href="#" class="avtar avtar-s btn-link-secondary customModal"
                                            data-size="lg" data-url="<?php echo e(route('invoice.reminder', $invoice->id)); ?>"
                                            data-bs-toggle="tooltip" data-bs-original-title="<?php echo e(__('Payment Reminder')); ?>"
                                            data-title="<?php echo e(__('Payment Reminder')); ?>">
                                            <i class="ph-duotone ph-repeat f-22"></i>
                                        </a>
                                    </li>
                                <?php endif; ?>
                            <?php endif; ?>
                            <li class="list-inline-item align-bottom me-2">
                                <a href="#" class="avtar avtar-s btn-link-secondary print" data-bs-toggle="tooltip"
                                    data-bs-original-title="<?php echo e(__('Download')); ?>">
                                    <i class="ph-duotone ph-printer f-22"></i>
                                </a>
                            </li>

                        </ul>
                    </div>

                    <div class="card-body" id="invoice-print">
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="row align-items-center g-3">
                                    <div class="col-sm-6">
                                        <div class="d-flex align-items-center mb-2 navbar-brand img-fluid invoice-logo">
                                            <img src="<?php echo e(asset(Storage::url('upload/logo/')) . '/' . (isset($admin_logo) && !empty($admin_logo) ? $admin_logo : 'logo.png')); ?>"
                                                class="img-fluid brand-logo" alt="images" />
                                        </div>
                                        <p class="mb-0"><?php echo e(invoicePrefix() . $invoice->invoice_id); ?></p>
                                    </div>
                                    <div class="col-sm-6 text-sm-end">
                                        <h6>
                                            <?php echo e(__('Invoice Month')); ?>

                                            <span
                                                class="text-muted f-w-400"><?php echo e(date('F Y', strtotime($invoice->invoice_month))); ?></span>
                                        </h6>
                                        <h6>
                                            <?php echo e(__('Due Date')); ?>

                                            <span class="text-muted f-w-400"><?php echo e(dateFormat($invoice->end_date)); ?></span>
                                        </h6>
                                        <h6>
                                            <?php echo e(__('Status')); ?>

                                            <span class="text-muted f-w-400">
                                                <?php if($invoice->status == 'unpaid'): ?>
                                                    <span
                                                        class="badge text-bg-danger"><?php echo e(\App\Models\Invoice::$status[$invoice->status]); ?></span>
                                                <?php elseif($invoice->status == 'paid'): ?>
                                                    <span
                                                        class="badge text-bg-success"><?php echo e(\App\Models\Invoice::$status[$invoice->status]); ?></span>
                                                <?php elseif($invoice->status == 'partial_paid'): ?>
                                                    <span
                                                        class="badge text-bg-warning"><?php echo e(\App\Models\Invoice::$status[$invoice->status]); ?></span>
                                                <?php endif; ?>
                                            </span>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="border rounded p-3">
                                    <h6 class="mb-0">From:</h6>
                                    <h5><?php echo e($settings['company_name']); ?></h5>
                                    <p class="mb-0"><?php echo e($settings['company_phone']); ?></p>
                                    <p class="mb-0"><?php echo e($settings['company_email']); ?></p>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="border rounded p-3">
                                    <h6 class="mb-0">To:</h6>
                                    <h5><?php echo e(!empty($tenant) && !empty($tenant->user) ? $tenant->user->first_name . ' ' . $tenant->user->last_name : ''); ?>

                                    </h5>
                                    <p class="mb-0">
                                        <?php echo e(!empty($tenant) && !empty($tenant->user) ? $tenant->user->phone_number : '-'); ?>

                                    </p>
                                    <p class="mb-0">
                                        <?php echo e(!empty($tenant) ? $tenant->address : ''); ?>

                                    </p>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                            <tr>
                                                <th width="46%"><?php echo e(__('Type')); ?></th>
                                                <th width="46%"><?php echo e(__('Description')); ?></th>
                                                <th><?php echo e(__('Amount')); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $__currentLoopData = $invoice->types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td><?php echo e(!empty($type->types) ? $type->types->title : '-'); ?></td>
                                                    <td><?php echo e($type->description); ?></td>
                                                    <td><?php echo e(priceFormat($type->amount)); ?></td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-start">
                                    <hr class="mb-2 mt-1 border-secondary border-opacity-50" />
                                </div>
                            </div>
                            <div class="col-12 ">
                                <div class="invoice-total ms-auto">
                                    <div class="row">

                                        <div class="col-4">
                                            <p class="f-w-600 mb-1 text-start"><?php echo e(__('Total')); ?> :</p>
                                        </div>
                                        <div class="col-7">
                                            <p class="f-w-600 mb-1 text-end">
                                                <?php echo e(priceFormat($invoice->getInvoiceSubTotalAmount())); ?>

                                            </p>
                                        </div>
                                        <div class="col-4">
                                            <p class="f-w-600 mb-1 text-start"><?php echo e(__('Due Amount')); ?> :</p>
                                        </div>
                                        <div class="col-7">
                                            <p class="f-w-600 mb-1 text-end">
                                                <?php echo e(priceFormat($invoice->getInvoiceDueAmount())); ?>

                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>

        <?php if($invoice->getInvoiceDueAmount() > 0): ?>
            <?php if(\Auth::user()->type == 'tenant'): ?>
                <div class="mt-25 col-lg-4 col-md-12" id="paymentModal" style="">
                    <div class="card">

                        <div class="col-xxl-12 cdx-xxl-100">
                            <div class="payment-method">
                                <div class="card-header">
                                    <h5> Add Payment </h5>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-tabs profile-tabs border-bottom mb-3 d-print-none" id="myTab"
                                        role="tablist">
                                        <?php if($settings['bank_transfer_payment'] == 'on'): ?>
                                            <li class="nav-item">
                                                <a class="nav-link active" id="profile-tab-1" data-bs-toggle="tab"
                                                    href="#bank_transfer" role="tab"
                                                    aria-selected="true"><?php echo e(__('Bank Transfer')); ?> </a>

                                            </li>
                                        <?php endif; ?>

                                        <?php if($settings['STRIPE_PAYMENT'] == 'on' && !empty($settings['STRIPE_KEY']) && !empty($settings['STRIPE_SECRET'])): ?>
                                            <li class="nav-item">

                                                <a class="nav-link" id="profile-tab-2" data-bs-toggle="tab"
                                                    href="#stripe_payment" role="tab"
                                                    aria-selected="true"><?php echo e(__('Stripe')); ?></a>
                                            </li>
                                        <?php endif; ?>


                                        <?php if(
                                            $settings['paypal_payment'] == 'on' &&
                                                !empty($settings['paypal_client_id']) &&
                                                !empty($settings['paypal_secret_key'])): ?>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab-3" data-bs-toggle="tab"
                                                    href="#paypal_payment" role="tab" aria-selected="true">
                                                    <?php echo e(__('Paypal')); ?> </a>
                                            </li>
                                        <?php endif; ?>

                                        <?php if(
                                            $settings['flutterwave_payment'] == 'on' &&
                                                !empty($settings['flutterwave_public_key']) &&
                                                !empty($settings['flutterwave_secret_key'])): ?>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab-3" data-bs-toggle="tab"
                                                    href="#flutterwave_payment" role="tab" aria-selected="true">
                                                    <?php echo e(__('Flutterwave')); ?>

                                                </a>
                                            </li>
                                        <?php endif; ?>

                                    </ul>

                                    <div class="tab-content">
                                        <?php if($settings['bank_transfer_payment'] == 'on'): ?>
                                            <div class="tab-pane fade active show" id="bank_transfer">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class=" profile-user-box">
                                                            <form
                                                                action="<?php echo e(route('invoice.banktransfer.payment', \Illuminate\Support\Facades\Crypt::encrypt($invoice->id))); ?>"
                                                                method="post" class="require-validation"
                                                                id="bank-payment" enctype="multipart/form-data">
                                                                <?php echo csrf_field(); ?>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="f-w-600 mb-1 text-start"><?php echo e(__('Bank Name')); ?></label>
                                                                            <p><?php echo e($settings['bank_name']); ?></p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="f-w-600 mb-1 text-start"><?php echo e(__('Bank Holder Name')); ?></label>
                                                                            <p><?php echo e($settings['bank_holder_name']); ?></p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="f-w-600 mb-1 text-start"><?php echo e(__('Bank Account Number')); ?></label>
                                                                            <p><?php echo e($settings['bank_account_number']); ?></p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="f-w-600 mb-1 text-start"><?php echo e(__('Bank IFSC Code')); ?></label>
                                                                            <p><?php echo e($settings['bank_ifsc_code']); ?></p>
                                                                        </div>
                                                                    </div>
                                                                    <?php if(!empty($settings['bank_other_details'])): ?>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label for="card-name-on"
                                                                                    class="f-w-600 mb-1 text-start"><?php echo e(__('Bank Other Details')); ?></label>
                                                                                <p><?php echo e($settings['bank_other_details']); ?>

                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    <?php endif; ?>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="amount"
                                                                                class="form-label text-dark"><?php echo e(__('Amount')); ?></label>
                                                                            <input type="number" name="amount"
                                                                                class="form-control required"
                                                                                value="<?php echo e($invoice->getInvoiceDueAmount()); ?>"
                                                                                placeholder="<?php echo e(__('Enter Amount')); ?>"
                                                                                required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="form-label text-dark"><?php echo e(__('Attachment')); ?></label>
                                                                            <input type="file" name="receipt"
                                                                                id="receipt" class="form-control"
                                                                                required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="notes"
                                                                                class="form-label text-dark"><?php echo e(__('Notes')); ?></label>
                                                                            <input type="text" name="notes"
                                                                                class="form-control " value=""
                                                                                placeholder="<?php echo e(__('Enter notes')); ?>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-12 ">
                                                                        <input type="submit" value="<?php echo e(__('Pay')); ?>"
                                                                            class="btn btn-primary">
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endif; ?>

                                        <?php if($settings['STRIPE_PAYMENT'] == 'on' && !empty($settings['STRIPE_KEY']) && !empty($settings['STRIPE_SECRET'])): ?>
                                            <div class="tab-pane fade " id="stripe_payment">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class=" profile-user-box">
                                                            <form
                                                                action="<?php echo e(route('invoice.stripe.payment', \Illuminate\Support\Facades\Crypt::encrypt($invoice->id))); ?>"
                                                                method="post" class="require-validation"
                                                                id="stripe-payment">
                                                                <?php echo csrf_field(); ?>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="amount"
                                                                                class="form-label text-dark"><?php echo e(__('Amount')); ?></label>
                                                                            <input type="number" name="amount"
                                                                                class="form-control required"
                                                                                value="<?php echo e($invoice->getInvoiceDueAmount()); ?>"
                                                                                placeholder="<?php echo e(__('Enter Amount')); ?>"
                                                                                required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="card-name-on"
                                                                                class="form-label text-dark"><?php echo e(__('Card Name')); ?></label>
                                                                            <input type="text" name="name"
                                                                                id="card-name-on"
                                                                                class="form-control required"
                                                                                placeholder="<?php echo e(__('Card Holder Name')); ?>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <label for="card-name-on"
                                                                            class="form-label text-dark"><?php echo e(__('Card Details')); ?></label>
                                                                        <div id="card-element">
                                                                        </div>
                                                                        <div id="card-errors" role="alert"></div>
                                                                    </div>
                                                                    <div class="col-sm-12 mt-3">

                                                                        <input type="submit" value="<?php echo e(__('Pay Now')); ?>"
                                                                            class="btn btn-primary">
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <?php if(
                                            $settings['paypal_payment'] == 'on' &&
                                                !empty($settings['paypal_client_id']) &&
                                                !empty($settings['paypal_secret_key'])): ?>
                                            <div class="tab-pane fade" id="paypal_payment">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class=" profile-user-box">
                                                            <form
                                                                action="<?php echo e(route('invoice.paypal', \Illuminate\Support\Facades\Crypt::encrypt($invoice->id))); ?>"
                                                                method="post" class="require-validation">
                                                                <?php echo csrf_field(); ?>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label for="amount"
                                                                                class="form-label text-dark"><?php echo e(__('Amount')); ?></label>
                                                                            <input type="number" name="amount"
                                                                                class="form-control required"
                                                                                value="<?php echo e($invoice->getInvoiceDueAmount()); ?>"
                                                                                placeholder="<?php echo e(__('Enter Amount')); ?>"
                                                                                required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-12 ">
                                                                        <input type="submit" value="<?php echo e(__('Pay Now')); ?>"
                                                                            class="btn btn-primary">
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <?php if(
                                            $settings['flutterwave_payment'] == 'on' &&
                                                !empty($settings['flutterwave_public_key']) &&
                                                !empty($settings['flutterwave_secret_key'])): ?>
                                            <div class="tab-pane fade" id="flutterwave_payment">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class=" profile-user-box">
                                                            <form action="#" method="post"
                                                                class="require-validation" id="flutterwavePaymentForm">
                                                                <?php echo csrf_field(); ?>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">

                                                                            <label for="amount"
                                                                                class="form-label text-dark"><?php echo e(__('Amount')); ?></label>
                                                                            <input type="number" name="amount"
                                                                                class="form-control amount required"
                                                                                value="<?php echo e($invoice->getInvoiceDueAmount()); ?>"
                                                                                placeholder="<?php echo e(__('Enter Amount')); ?>"
                                                                                required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-12 ">
                                                                        <input type="button" value="<?php echo e(__('Pay Now')); ?>"
                                                                            class="btn btn-primary"
                                                                            id="flutterwavePaymentBtn">
                                                                    </div>

                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php else: ?>
                <div class="mt-25 col-lg-4 col-md-12" id="paymentModal" style="">
                    <div class="card">

                        <div class="col-xxl-12 cdx-xxl-100">
                            <div class="payment-method">
                                <div class="card-header">
                                    <h5> Add Payment </h5>
                                </div>
                                <div class="card-body">

                                    <?php echo e(Form::open(['route' => ['invoice.payment.store', $invoice->id], 'method' => 'post', 'enctype' => 'multipart/form-data'])); ?>

                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="form-group  col-md-12">
                                                <?php echo e(Form::label('payment_date', __('Payment Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('payment_date', date('Y-m-d'), ['class' => 'form-control'])); ?>

                                            </div>
                                            <div class="form-group  col-md-12">
                                                <?php echo e(Form::label('amount', __('Amount'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::number('amount', $invoice->getInvoiceDueAmount(), ['class' => 'form-control'])); ?>

                                            </div>
                                            <div class="form-group  col-md-12">
                                                <?php echo e(Form::label('receipt', __('Receipt'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::file('receipt', ['class' => 'form-control'])); ?>

                                            </div>
                                            <div class="form-group ">
                                                <?php echo e(Form::label('notes', __('Notes'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::textarea('notes', null, ['class' => 'form-control', 'rows' => 3, 'placeholder' => __('Enter Payment Notes')])); ?>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                        <?php echo e(Form::submit(__('Add'), ['class' => 'btn btn-secondary btn-rounded'])); ?>

                                    </div>
                                    <?php echo e(Form::close()); ?>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        <?php endif; ?>


    </div>

    <div class="row">
        <div class="col-12">
            <div class="card" id="invoice-print">
                <div class="card-header">
                    <h5><?php echo e(__('Payment History')); ?></h5>
                </div>
                <div class="card-body pt-0">
                    <div class="dt-responsive table-responsive">
                        <table class="table table-hover ">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('Transaction Id')); ?></th>
                                    <th><?php echo e(__('Payment Date')); ?></th>
                                    <th><?php echo e(__('Amount')); ?></th>
                                    <th><?php echo e(__('Notes')); ?></th>
                                    <th><?php echo e(__('Receipt')); ?></th>
                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('delete invoice payment')): ?>
                                        <th class="text-right"><?php echo e(__('Action')); ?></th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $invoice->payments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr role="row">
                                        <td><?php echo e($payment->transaction_id); ?> </td>
                                        <td><?php echo e(dateFormat($payment->payment_date)); ?> </td>
                                        <td><?php echo e(priceFormat($payment->amount)); ?> </td>
                                        <td><?php echo e($payment->notes); ?> </td>
                                        <td>
                                            <?php if(!empty($payment->receipt)): ?>
                                                <a href="<?php echo e(asset(Storage::url('upload/receipt')) . '/' . $payment->receipt); ?>"
                                                    download="download"><i data-feather="download"></i></a>
                                            <?php else: ?>
                                                -
                                            <?php endif; ?>
                                        </td>
                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('delete invoice payment')): ?>
                                            <td class="text-right">
                                                <div class="cart-action">
                                                    <?php echo Form::open(['method' => 'DELETE', 'route' => ['invoice.payment.destroy', $invoice->id, $payment->id]]); ?>

                                                    <a class=" text-danger confirm_dialog" data-bs-toggle="tooltip"
                                                        data-bs-original-title="<?php echo e(__('Detete')); ?>" href="#"> <i
                                                            data-feather="trash-2"></i></a>
                                                    <?php echo Form::close(); ?>

                                                </div>
                                            </td>
                                        <?php endif; ?>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/invoice/show.blade.php ENDPATH**/ ?>