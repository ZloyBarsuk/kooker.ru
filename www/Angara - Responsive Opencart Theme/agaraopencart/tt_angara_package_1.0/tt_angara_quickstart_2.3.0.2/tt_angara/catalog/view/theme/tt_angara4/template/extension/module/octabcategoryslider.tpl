<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">
$(document).ready(function() {
	$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
	$(".<?php echo $cateogry_alias;?> .tab_content_category:first").show(); 
    $(".<?php echo $cateogry_alias;?> ul.tabs-categorys li:first").addClass("active");
	$(".<?php echo $cateogry_alias;?> ul.tabs-categorys li").click(function() {
		$(".<?php echo $cateogry_alias;?> ul.tabs-categorys li").removeClass("active");
		$(".<?php echo $cateogry_alias;?> ul.tabs-categorys .owl-item").removeClass("active");
		$(this).addClass("active");
		$(this).parent().addClass("active");
		$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
		$(".<?php echo $cateogry_alias;?> .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).show(); 
	});
});
</script>
<?php
	$row = $config_slide['f_rows'];
	if(!$row) {$row=1;}
?>
<div class="product-tabs-category-container-slider tabcategory-container <?php echo $cateogry_alias;?> quickview-products">
	<div class="row">
		<div class="col-xs-12 col-sm-4 col-md-8 col-lg-2">
			<div class="tab-title">
				<div class="module-title">
					<h2><?php echo $title;?></h2>
				</div>
				<ul class="tabs-categorys"> 
					<?php $count=0; ?>
					<?php foreach($category_products as $cate_id => $products ){ ?>
						<?php if (isset($array_cates[$cate_id]['name'])) {?>
						<li rel="tab_cate<?php echo $cate_id; ?>"  >
							<?php  echo $array_cates[$cate_id]['name']; ?>
							<?php if($array_cates[$cate_id]['thumbnail_image']): ?>
								<img class="thumb-img" src="<?php echo $array_cates[$cate_id]['thumbnail_image']; ?>" alt="<?php echo $array_cates[$cate_id]['name']; ?>" />
							<?php endif; ?>
						</li>
						<?php } ?>
							<?php $count= $count+1; ?>
					<?php } ?>	
				</ul>
			</div>
		</div>
		<div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
			<div class="images-category">
				<img src="<?php echo $config_slide['image4'] ?>" alt="#" >
			</div>
		</div>
		<div class="col-xs-12 col-lg-6 md_clear">
			<div class="tab_container_category quickview-added"> 
			<?php foreach($category_products as $cate_id => $products ){ ?>
				<div id="tab_cate<?php echo $cate_id; ?>" class="tab_content_category">
						<?php $f_product = $f_products[$cate_id]; ?>
						<div class="product-big-container">
							<div class="product-big product-thumb item-inner">
								<div class="images-container">
									<?php if($config_slide['tab_cate_show_label']): ?>
										<?php if($f_product['special']) { ?>
											<div class="label-product <?php if($f_product['is_new']){ echo " f-label "; } ?>">
												<span><?php echo $text_sale; ?></span>
											</div>
										<?php }?>
										<?php if($f_product['is_new']){ ?>
										<div class="label-product l-new">
											<span><?php echo $text_new; ?></span>
										</div>
										<?php } ?>
									<?php endif;?>
									<a href="<?php echo $f_product['href']; ?>">
									<?php if ($f_product['thumb']) { ?>
										<?php if($f_product['rotator_image']){ ?><img class="img-r lazy image2" src="<?php echo $f_product['rotator_image']; ?>" alt="<?php echo $f_product['name']; ?>" /><?php } ?>
									<?php } else { ?>
									<img src="image/cache/no_image-100x100.png" alt="<?php echo $f_product['name']; ?>" />
									<?php } ?>
									<img src="<?php echo $f_product['thumb']; ?>" alt="<?php echo $f_product['name']; ?>" title="<?php echo $f_product['name']; ?>" class="img-responsive lazy image1" />
									</a>
								</div>
								<div class="des-container">
									<h2 class="product-name"><a href="<?php echo $f_product['href']; ?>"><?php echo $f_product['name']; ?></a></h2>
									<div class="description">
										<?php echo $f_product['description']; ?>
									</div>
									<?php if (isset($f_product['rating'])) { ?>
									  <div class="ratings">
										  <div class="rating-box">
											  <?php for ($i = 0; $i <= 5; $i++) { ?>
												  <?php if ($f_product['rating'] == $i) {
													  $class_r= "rating".$i;
													  echo '<div class="'.$class_r.'">rating</div>';
												  } 
											  }  ?>
										  </div>
									  </div>
									<?php } ?>
									<div class="price-label">
										<div class="box-price">
											<?php if($config_slide['tab_cate_show_price']) { ?>
													<?php if ($f_product['price']) { ?>
														<?php if (!$f_product['special']) { ?>
															<div class="price-box box-regular">
																<span class="regular-price">
																	<span class="price"><?php echo $f_product['price']; ?></span>
																</span>
															</div>
														<?php } else { ?>
															<div class="price-box box-special">
																<p class="special-price"><span class="price"><?php echo $f_product['special']; ?></span></p>
																<p class="old-price"><span class="price"><?php echo $f_product['price']; ?></span></p>
															</div>
														<?php } ?>
													<?php } ?>								<?php } ?>
										</div>
									</div>
									<div class="actions-big">
										<div class="add-to-links-big">
											<div class="cart">
												<?php if($config_slide['tab_cate_show_addtocart']) { ?>
													<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $f_product['product_id']; ?>');">
														<span><span><?php echo $button_cart; ?></span></span>
													</button>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="productTabContent owl-demo-tabcate">
							<?php if($category_e_f_products[$cate_id]): ?>
							<?php $count = 0; ?>
							<?php foreach ($category_e_f_products[$cate_id] as $product){ ?>
								<?php if($count % $row ==0){  echo  "<div class='row_items'>";} $count++; ?>
							<div class="product-thumb item-inner">
								<div class="images-container">
									<?php if($config_slide['tab_cate_show_label']): ?>
										<?php if($product['special']) { ?>
											<div class="label-product <?php if($product['is_new']){ echo " f-label "; } ?>">
												<span><?php echo $text_sale; ?></span>
											</div>
										<?php }?>
										<?php if($product['is_new']){ ?>
										<div class="label-product l-new">
											<span><?php echo $text_new; ?></span>
										</div>
										<?php } ?>
									<?php endif;?>
									<a href="<?php echo $product['href']; ?>">
									<?php if ($product['thumb']) { ?>
										<?php if($product['rotator_image']){ ?><img class="img-r lazy image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
									<?php } else { ?>
									<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
									<?php } ?>
									<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy image1" />
									</a>
								</div>
								<div class="des-container">
									<h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
									<?php if($config_slide['tab_cate_show_des']) { ?>
									<p class="product-des"><?php echo $product['description']; ?></p>
									<?php } ?>
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
												<?php if($config_slide['tab_cate_show_price']) { ?>
														<?php if ($product['price']) { ?>
															<?php if (!$product['special']) { ?>
																<div class="price-box box-regular">
																	<span class="regular-price">
																		<span class="price"><?php echo $product['price']; ?></span>
																	</span>
																</div>
															<?php } else { ?>
																<div class="price-box box-special">
																	<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
																	<p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
																</div>
															<?php } ?>
														<?php } ?>								<?php } ?>
											</div>
										</div>
									</div>
									<div class="description">
										<?php echo $product['description']; ?>
									</div>
									<div class="actions">
										<div class="add-to-links">
											<div class="cart">
												<?php if($config_slide['tab_cate_show_addtocart']) { ?>
													<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
														<span><span><?php echo $button_cart; ?></span></span>
													</button>
												<?php } ?>
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
								</div>
							</div>
								<?php if($count % $row == 0 ): ?>
								</div><!-- row_items-->
							 <?php else: ?>
								<?php if($count == count($category_e_f_products[$cate_id])): ?>
									</div><!-- row_items-->
								<?php endif; ?>
							 <?php endif; ?>
							<?php } ?>
							<?php else: ?>
								<p><?php echo $text_empty; ?></p>
							<?php endif; ?>
						</div><!-- productTabContent -->
					</div>
				<?php } ?>
			</div> <!-- .tab_container_category -->
		</div>
	</div>
</div><!-- <?php echo $cateogry_alias;?> -->
<script type="text/javascript">
$(document).ready(function() { 
  $(".<?php echo $cateogry_alias;?> .owl-demo-tabcate").owlCarousel({
	autoPlay: <?php if($config_slide['tab_cate_autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
	items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	slideSpeed : <?php if($config_slide['tab_cate_speed_slide']) { echo $config_slide['tab_cate_speed_slide'] ;} else { echo 200;} ?>,
	navigation : <?php if($config_slide['tab_cate_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	paginationNumbers : true,
	pagination : <?php if($config_slide['tab_cate_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	stopOnHover : false,
	itemsDesktop : [1199,4],
	itemsDesktopSmall : [991,3],
	itemsTablet: [768,2],
	itemsMobile : [480,1]
  });
});
</script>