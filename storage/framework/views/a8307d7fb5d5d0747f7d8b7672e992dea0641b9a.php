<?php echo e(Form::open(array('url'=>'note','method'=>'post', 'enctype' => "multipart/form-data"))); ?>

<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            <?php echo e(Form::label('title',__('Title'),array('class'=>'form-label'))); ?>

            <?php echo e(Form::text('title',null,array('class'=>'form-control','placeholder'=>__('Enter note title')))); ?>

        </div>
        <div class="form-group  col-md-12">
            <?php echo e(Form::label('attachment',__('Attachment'),array('class'=>'form-label'))); ?>

            <?php echo e(Form::file('attachment',array('class'=>'form-control'))); ?>

        </div>
        <div class="form-group  col-md-12">
            <?php echo e(Form::label('description',__('Description'),array('class'=>'form-label'))); ?>

            <?php echo e(Form::textarea('description',null,array('class'=>'form-control','rows'=>5))); ?>

        </div>
    </div>
</div>
<div class="modal-footer">
    <?php echo e(Form::submit(__('Create'),array('class'=>'btn btn-secondary btn-rounded'))); ?>

</div>
<?php echo e(Form::close()); ?>



<?php /**PATH /home/u951923677/domains/lapetoo.com/public_html/monolith/resources/views/note/create.blade.php ENDPATH**/ ?>