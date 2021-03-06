<script type="text/javascript">
	if (typeof OC == 'undefined') OC = { };
	OC.Countdown = {
		TEXT_YEARS 		: '<?php echo $text_years ?>',
		TEXT_MONTHS 	: '<?php echo $text_months ?>',
		TEXT_WEEKS 		: '<?php echo $text_weeks ?>',
		TEXT_DAYS 		: '<?php echo $text_days ?>',
		TEXT_HOURS 		: '<?php echo $text_hours ?>',
		TEXT_MINUTES 	: '<?php echo $text_minutes ?>',
		TEXT_SECONDS 	: '<?php echo $text_seconds ?>'
	};
</script>
<script type="text/javascript" src="catalog/view/javascript/jquery.countdown.js"></script>
<?php
	  $count = 0;
	  $rows = 1;
   ?>
<div class="occountdown_module occountdown-container quickview-products">
<div class="countdown-title module-title"><h2><?php echo $title; ?></h2></div>
<?php if($products): ?>
	<div class="countdown-product-inner">
    <?php foreach ($products as $product) : ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
            <div class="item">
				<div class="item-inner">
					<?php if($config_slide['f_show_label']): ?>
						<?php if($product['special']) { ?>
						  <div class="label-product <?php if($product['is_new']){ echo " f-label"; } ?>">
							  <span><?php echo $text_sale; ?></span>
						  </div>
						  <?php }?>
						<?php if($product['is_new']){ ?>
						  <div class="label-product l-new">
							  <span><?php echo $text_new; ?></span>
						  </div>
						  <?php } ?>
					<?php endif; ?>
					<div class="images-container">
						<a class="product-image" href="<?php echo $product['href']; ?>">
							<?php if($product['rotator_image']): ?>
							<img class="image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
							<?php endif; ?>
							<img class="image1" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
						</a>
						<?php if(strtotime($product['date_end'])) { ?>
						<div id="Countdown<?php echo $product['product_id']?>" class="box-timer"></div>
						<?php if(strtotime($product['date_end'])) { ?>
							<script type="text/javascript">
								$(function () {
									var austDay = new Date();
									austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
									$('#Countdown<?php echo $product['product_id'];?>').countdown({
										until: new Date(
											<?php echo date("Y",strtotime($product['date_end']))?>,
											<?php echo date("m",strtotime($product['date_end']))?> -1, 
											<?php echo date("d",strtotime($product['date_end']))?>,
											<?php echo date("H",strtotime($product['date_end']))?>,
											<?php echo date("i",strtotime($product['date_end']))?>, 
											<?php echo date("s",strtotime($product['date_end']))?>
											)
									});
									//$('#Countdown<?php echo $product['product_id'];?>').countdown('pause');
								});
							</script>
						<?php } ?>
						<?php } ?>
					</div><!-- image -->
				<div class="des-container">
					<h2 class="product-name">
						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</h2>
					<div class="description"><?php //echo $product['description']; ?></div>
					<div class="price-rating">
						<?php if (isset($product['rating'])) { ?>
						  <div class="ratings">
							  <div class="rating-box">
								  <?php for ($i = 0; $i <= 5; $i++) { ?>
									  <?php if ($product['rating'] == $i) {
										  $class_r= "rating".$i;
										  echo '<div class="'.$class_r.'">rating</div>';
									  } 
								  }  ?>
							  </div>
						  </div>
						<?php } ?>
						<div class="price-label">
							<div class="box-price">
								<?php if ($product['orgprice']) { ?>
									<p class="price">
									  <?php if (!$product['special']) { ?>
										<?php echo $product['orgprice']; ?>
									  <?php } else { ?>
											<span class="price-new"><?php echo $product['special']; ?></span>
											<span class="price-old"><?php echo $product['orgprice']; ?></span>
									  <?php } ?>
									</p>
								<?php } ?>
							</div>
						</div>
					</div>
					<div class="actions">
						<div class="add-to-links">
							<div class="cart">
								<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								<span><span><?php echo $button_cart; ?></span></span>
								</button>
							</div>
							<div class="wishlist">
								<a class="link-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
									<em><?php echo $button_wishlist; ?></em>
								</a>
							</div>
							<div class="compare">
								<a class="link-compare" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
									<em><?php echo $button_compare; ?></em>
								</a>
							</div>
							<div class="btn-quick-view"></div>
						</div>						
					</div>
				</div><!-- product-inner -->
				</div>				
			</div>
			<?php if($count % $rows == 0 || $count == count($products)): ?>
				</div>
			<?php endif; ?>
    <?php endforeach;  ?>
	</div>
<?php else: ?>
<p><?php echo $text_empty; ?></p>
<?php endif; ?>
</div>
<script type="text/javascript">
	$('.countdown-product-inner').owlCarousel({
		autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		itemsDesktop : [1199,4],
		itemsDesktopSmall : [991,3],
		itemsTablet: [768,2],
		itemsMobile : [480,1],
		slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 2000;} ?>,
		paginationSpeed : 3000,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		scrollPerPage:true,
	});
</script>