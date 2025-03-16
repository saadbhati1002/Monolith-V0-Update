<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Subscription')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startPush('script-page'); ?>
    <script src="https://js.stripe.com/v3/"></script>
    <script>
        $(document).on('click', '.have_coupon', function() {
            var element = $(this).parent().parent().parent().parent().parent().find('.coupon_div');
            if ($(this).is(":checked")) {
                $(element).removeClass('d-none');
            } else {
                $(element).addClass('d-none');
            }
        });

        $(document).on('click', '.packageCouponApplyBtn', function() {
            var element = $(this);
            var couponCode = element.closest('.row').find('.packageCouponCode').val();
            $.ajax({
                url: '<?php echo e(route('coupons.apply')); ?>',
                datType: 'json',
                data: {
                    package: '<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($subscription->id)); ?>',
                    coupon: couponCode
                },
                success: function(result) {
                    $('.discoutedPrice').text(result.discoutedPrice);
                    $('#amount').val(result.discoutedPrice);
                    if (result != '') {
                        if (result.status == true) {
                            toastrs('success', result.msg, 'success');
                        } else {
                            toastrs('Error', result.msg, 'error');
                        }
                    } else {
                        toastrs('Error', "<?php echo e(__('Please enter coupon code.')); ?>", 'error');
                    }
                }
            })
        });
    </script>

    <script>
        <?php if($settings['STRIPE_PAYMENT'] == 'on' && !empty($settings['STRIPE_KEY']) && !empty($settings['STRIPE_SECRET'])): ?>
            var stripe_key = Stripe('<?php echo e($settings['STRIPE_KEY']); ?>');
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

            var stripe_form = document.getElementById('stripe-payment-form');
            stripe_form.addEventListener('submit', function(event) {
                event.preventDefault();

                stripe_key.createToken(stripe_card).then(function(result) {
                    if (result.error) {
                        $("#stripe_card_errors").html(result.error.message);
                        $.NotificationApp.send("Error", result.error.message, "top-right",
                            "rgba(0,0,0,0.2)", "error");
                    } else {
                        var token = result.token;
                        var stripeForm = document.getElementById('stripe-payment-form');
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
            $settings['flutterwave_payment'] == 'on' &&
                !empty($settings['flutterwave_public_key']) &&
                !empty($settings['flutterwave_secret_key'])): ?>

            $(document).on("click", "#flutterwavePaymentBtn", function() {
                var discoutedPrice = $('.discoutedPrice').text();
                var amount = discoutedPrice.replace("$", "");
                var flutterwaveCallbackURL = "<?php echo e(url('subscription/flutterwave/')); ?>";
                var tx_ref = "RX1_" + Math.floor((Math.random() * 1000000000) + 1);
                var customer_email = '<?php echo e(\Auth::user()->email); ?>';
                var customer_name = '<?php echo e(\Auth::user()->name); ?>';
                var flutterwave_public_key = '<?php echo e($settings['flutterwave_public_key']); ?>';
                var nowTim = "<?php echo e(date('d-m-Y-h-i-a')); ?>";
                var currency = '<?php echo e($settings['CURRENCY']); ?>';

                if (amount) {
                    var flutterwavePayment = getpaidSetup({
                        txref: tx_ref,
                        PBFPubKey: flutterwave_public_key,
                        amount: amount,
                        currency: currency,
                        customer_name: customer_name,
                        customer_email: customer_email,
                        meta: [{
                            consumer_id: "23",
                            consumer_mac: "92a3-912ba-1192a"
                        }],
                        onclose: function() {},
                        callback: function(result) {
                            var txRef = result.tx.txRef;
                            var redirectUrl = flutterwaveCallbackURL + '/' +
                                '<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($subscription->id)); ?>' +
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
            <a href="<?php echo e(route('subscriptions.index')); ?>"><?php echo e(__('Subscription')); ?></a>
        </li>
        <li class="breadcrumb-item active">
            <a href="#"><?php echo e(__('Details')); ?></a>
        </li>
    </ul>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row pricing-grid">
        <div class="col-12">
            <div class="card">
                <div class="card-body pt-0">
                    <div class="dt-responsive table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('Title')); ?></th>
                                    <th><?php echo e(__('Amount')); ?></th>
                                    <th><?php echo e(__('Interval')); ?></th>
                                    <th><?php echo e(__('User Limit')); ?></th>
                                    <th><?php echo e(__('Property Limit')); ?></th>
                                    <th><?php echo e(__('Tenant Limit')); ?></th>
                                    <th><?php echo e(__('Coupon Applicable')); ?></th>
                                    <th><?php echo e(__('User Logged History')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <?php echo e($subscription->title); ?>

                                    </td>
                                    <td>
                                        <b class="discoutedPrice">
                                            <?php echo e(subscriptionPaymentSettings()['CURRENCY_SYMBOL']); ?><?php echo e($subscription->package_amount); ?></b>
                                    </td>
                                    <td><?php echo e($subscription->interval); ?> </td>
                                    <td><?php echo e($subscription->user_limit); ?> </td>
                                    <td><?php echo e($subscription->property_limit); ?></td>
                                    <td><?php echo e($subscription->tenant_limit); ?></td>
                                    <td>
                                        <?php if($subscription->couponCheck() > 0): ?>
                                            <i class="text-success mr-4" data-feather="check-circle"></i>
                                        <?php else: ?>
                                            <i class="text-danger mr-4" data-feather="x-circle"></i>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if($subscription->enabled_logged_history == 1): ?>
                                            <i class="text-success mr-4" data-feather="check-circle"></i>
                                        <?php else: ?>
                                            <i class="text-danger mr-4" data-feather="x-circle"></i>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="row pricing-grid">
            <div class="col-lg-12">
                <div class="row">
                    <?php if($settings['bank_transfer_payment'] == 'on'): ?>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Bank Transfer Payment')); ?></h5>
                                    <?php if($subscription->couponCheck() > 0): ?>
                                        <div class="setting-card action-menu">
                                            <div class="form-group">
                                                <div class="form-check custom-chek">
                                                    <input class="form-check-input have_coupon" type="checkbox"
                                                        value="" id="have_bank_tran_coupon">
                                                    <label class="form-check-label"
                                                        for="have_bank_tran_coupon"><?php echo e(__('Have a Discount Coupon Code?')); ?>

                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="card-body profile-user-box">
                                    <form
                                        action="<?php echo e(route('subscription.bank.transfer', \Illuminate\Support\Facades\Crypt::encrypt($subscription->id))); ?>"
                                        method="post" class="require-validation" id="bank-payment"
                                        enctype="multipart/form-data">
                                        <?php echo csrf_field(); ?>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Bank Name')); ?></label>
                                                    <p><?php echo e($settings['bank_name']); ?></p>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Bank Holder Name')); ?></label>
                                                    <p><?php echo e($settings['bank_holder_name']); ?></p>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Bank Account Number')); ?></label>
                                                    <p><?php echo e($settings['bank_account_number']); ?></p>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Bank IFSC Code')); ?></label>
                                                    <p><?php echo e($settings['bank_ifsc_code']); ?></p>
                                                </div>
                                            </div>
                                            <?php if(!empty($settings['bank_other_details'])): ?>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="card-name-on"
                                                            class="form-label text-dark"><?php echo e(__('Bank Other Details')); ?></label>
                                                        <p><?php echo e($settings['bank_other_details']); ?></p>
                                                    </div>
                                                </div>
                                            <?php endif; ?>

                                            <div class="col-md-12 d-none coupon_div">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Coupon Code')); ?></label>
                                                    <input type="text" name="coupon"
                                                        class="form-control required packageCouponCode"
                                                        placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Attachment')); ?></label>
                                                    <input type="file" name="payment_receipt" id="payment_receipt"
                                                        class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 ">
                                                <input type="button" value="<?php echo e(__('Coupon Apply')); ?>"
                                                    class="btn btn-warning packageCouponApplyBtn d-none coupon_div">
                                                <input type="submit" value="<?php echo e(__('Pay')); ?>" class="btn btn-primary">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if($settings['STRIPE_PAYMENT'] == 'on' && !empty($settings['STRIPE_KEY']) && !empty($settings['STRIPE_SECRET'])): ?>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Stripe Payment')); ?></h5>
                                    <?php if($subscription->couponCheck() > 0): ?>
                                        <div class="setting-card action-menu">
                                            <div class="form-group">
                                                <div class="form-check custom-chek">
                                                    <input class="form-check-input have_coupon" type="checkbox"
                                                        value="" id="have_stripe_coupon">
                                                    <label class="form-check-label"
                                                        for="have_stripe_coupon"><?php echo e(__('Have a Discount Coupon Code?')); ?>

                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="card-body profile-user-box">
                                    <form
                                        action="<?php echo e(route('subscription.stripe.payment', \Illuminate\Support\Facades\Crypt::encrypt($subscription->id))); ?>"
                                        method="post" class="require-validation" id="stripe-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="card-name-on"
                                                        class="form-label text-dark"><?php echo e(__('Card Name')); ?></label>
                                                    <input type="text" name="name" id="card-name-on"
                                                        class="form-control required"
                                                        placeholder="<?php echo e(__('Card Holder Name')); ?>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="card-name-on"
                                                    class="form-label text-dark"><?php echo e(__('Card Details')); ?></label>
                                                <div id="card-element">
                                                </div>
                                                <div id="stripe_card_errors" role="alert"></div>
                                            </div>

                                            <?php if($subscription->couponCheck() > 0): ?>
                                                <div class="col-md-12 d-none coupon_div">
                                                    <div class="form-group">
                                                        <label for="card-name-on"
                                                            class="form-label text-dark"><?php echo e(__('Coupon Code')); ?></label>
                                                        <input type="text" name="coupon"
                                                            class="form-control required packageCouponCode"
                                                            placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <div class="col-sm-12 mt-15">
                                                <?php if($subscription->couponCheck() > 0): ?>
                                                    <input type="button" value="<?php echo e(__('Coupon Apply')); ?>"
                                                        class="btn btn-warning packageCouponApplyBtn d-none coupon_div">
                                                <?php endif; ?>
                                                <input type="submit" value="<?php echo e(__('Pay')); ?>"
                                                    class="btn btn-primary">

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(
                        $settings['flutterwave_payment'] == 'on' &&
                            !empty($settings['flutterwave_public_key']) &&
                            !empty($settings['flutterwave_secret_key'])): ?>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Flutterwave Payment')); ?></h5>
                                    <?php if($subscription->couponCheck() > 0): ?>
                                        <div class="setting-card action-menu">
                                            <div class="form-group">
                                                <div class="form-check custom-chek">
                                                    <input class="form-check-input have_coupon" type="checkbox"
                                                        value="" id="have_flutterwave_coupon">
                                                    <label class="form-check-label"
                                                        for="have_flutterwave_coupon"><?php echo e(__('Have a Discount Coupon Code?')); ?>

                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="card-body profile-user-box">
                                    <form action="#" class="require-validation" method="get">
                                        <?php echo csrf_field(); ?>
                                        <div class="row">
                                            <?php if($subscription->couponCheck() > 0): ?>
                                                <div class="col-md-12 d-none coupon_div">
                                                    <div class="form-group">
                                                        <label for="card-name-on"
                                                            class="form-label text-dark"><?php echo e(__('Coupon Code')); ?></label>
                                                        <input type="text" name="coupon"
                                                            class="form-control required packageCouponCode"
                                                            placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <div class="col-sm-12">
                                                <?php if($subscription->couponCheck() > 0): ?>
                                                    <input type="button" value="<?php echo e(__('Coupon Apply')); ?>"
                                                        class="btn btn-warning packageCouponApplyBtn d-none coupon_div">
                                                <?php endif; ?>
                                                <input type="button" value="<?php echo e(__('Pay')); ?>"
                                                    id="flutterwavePaymentBtn" class="btn btn-primary">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(
                        $settings['paypal_payment'] == 'on' &&
                            !empty($settings['paypal_client_id']) &&
                            !empty($settings['paypal_secret_key'])): ?>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5><?php echo e(__('Paypal Payment')); ?></h5>
                                    <?php if($subscription->couponCheck() > 0): ?>
                                        <div class="setting-card action-menu">
                                            <div class="form-group">
                                                <div class="form-check custom-chek">
                                                    <input class="form-check-input have_coupon" type="checkbox"
                                                        value="" id="have_paypal_coupon">
                                                    <label class="form-check-label"
                                                        for="have_paypal_coupon"><?php echo e(__('Have a Discount Coupon Code?')); ?>

                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="card-body profile-user-box">
                                    <form
                                        action="<?php echo e(route('subscription.paypal', \Illuminate\Support\Facades\Crypt::encrypt($subscription->id))); ?>"
                                        method="post" class="require-validation">
                                        <?php echo csrf_field(); ?>
                                        <div class="row">
                                            <?php if($subscription->couponCheck() > 0): ?>
                                                <div class="col-md-12 mt-15 d-none coupon_div">
                                                    <div class="form-group">
                                                        <label for="card-name-on"
                                                            class="form-label text-dark"><?php echo e(__('Coupon Code')); ?></label>
                                                        <input type="text" name="coupon"
                                                            class="form-control required packageCouponCode"
                                                            placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <div class="col-sm-12 mt-15">
                                                <?php if($subscription->couponCheck() > 0): ?>
                                                    <input type="button" value="<?php echo e(__('Coupon Apply')); ?>"
                                                        class="btn btn-warning packageCouponApplyBtn d-none coupon_div">
                                                <?php endif; ?>
                                                <input type="submit" value="<?php echo e(__('Pay')); ?>"
                                                    class="btn btn-primary">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/subscription/show.blade.php ENDPATH**/ ?>