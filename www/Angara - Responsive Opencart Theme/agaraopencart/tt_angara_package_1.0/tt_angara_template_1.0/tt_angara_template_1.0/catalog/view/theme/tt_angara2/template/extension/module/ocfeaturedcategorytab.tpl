<?php if($status): ?>
	<?php if($exist_fcate): ?>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".featured-categorytab .tab_content_category").hide();
				$(".featured-categorytab .tab_content_category:first").show();
				$(".tabs-featured:first").addClass("active");
				$(".featured-categorytab div.featured-category .tabs-featured").click(function() {
					$(".tabs-featured").removeClass("active");
					$(this).addClass("active");
					$(this).parent().addClass("active");
					$(".featured-categorytab .tab_content_category").hide();
					$(".featured-categorytab .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
					var activeTab = $(this).attr("rel");
					$(".featured-categorytab #" + activeTab).addClass("animate1 <?php echo $tab_effect;?>");
					$(".featured-categorytab #" + activeTab).fadeIn();
				});
			});
		</script>
		
		<?php
			$rows2 = 5;
			$row = $config_slide['f_rows'];
			if(!$row) { $row = 1; }
		?>
<div class="product-tabs-category-container-slider featured-categorytab">
	<div class="module-title">
		<h2><?php echo $title; ?></h2>
	</div>
	<div class="featured-category-container">
		<div class="featured-category-icon">
			<div class="featured-category">
				<?php $count2 = 0; ?>
				<?php foreach($categories as $category ): ?>
					<?php  if($count2 % $rows2 == 0 ) { echo '<div class="row_items2">'; } $count2++; ?>
					<div class="tabs-featured  tab_cate<?php echo $category['category_id']; ?>" rel="tab_fcate<?php echo $category['category_id']; ?>">
						<?php if($category['thumbnail_image']): ?>
							<img class="imagehover" src="<?php echo $category['thumbnail_image'] ?>" alt="" />
						<?php endif; ?>
					</div>
					<?php if($count2 % $rows2 == 0 || $count2 == count($categories)): ?>
						</div> <!-- row_items2 -->
					<?php endif; ?>
				<?php endforeach; ?>
			</div>
		</div>
		<div class="tab_featured_category">
			<?php foreach($categories as $category): ?>
			<div id="tab_fcate<?php echo $category['category_id']; ?>" class="tab_content_category">
				<?php if($category['products']): ?>
					<div class="productTabContent owl-demo-tabcate">
						<?php $products = $category['products']; $i = 0; ?>
						<?php foreach ($products as $product): ?>
							<?php if($i++ % $row == 0){ echo "<div class='row_item'>"; } ?>
							<div class="item">
								<div class="item-inner">
									<div class="images-container">
											<?php if($config_slide['showlabel']): ?>
												<?php if ($product['special']) { ?>
														<span class="sale"><?php echo $text_sale; ?></span>
													<?php } else {if ($product['is_new']){?>
														<div class="new"><?php echo $text_new; ?></div>
												<?php }} ?>
											<?php endif; ?>
											<div class="image"><a href="<?php echo $product['href']; ?>"><img class="image1" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
											<?php if(isset($product['rotator_image']) && $product['rotator_image'] != ""): ?>
												<img class="image2" src="<?php echo $product['rotator_image'] ?>" alt="" />
											<?php endif; ?>
											</a></div>
									</div>
									<div class="des-container">
										<div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
										<?php if($config_slide['showdes']) { ?>
											<p class="product-des"><?php echo $product['description']; ?></p>
										<?php } ?>
										<?php if ($product['rating']) { ?>
											<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
										<?php } ?>
										<div class="price-label">
											<div class="box-price">
												<?php if($config_slide['showprice']) { ?>
													<?php if ($product['price']) { ?>
														<div class="price">
															<?php if (!$product['special']) { ?>
																<?php echo $product['price']; ?>
															<?php } else { ?>
																<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
															<?php } ?>
														</div>
													<?php } ?>
												<?php } ?>
											</div>
										</div>
										<div class="actions">
											<div class="add-to-links">
												<div class="cart">
													<?php if($config_slide['showaddtocart']) { ?>
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
											</div>
										</div>
									</div>
								</div>
							</div>
							<?php if($i % $row ==0 || $i == count($products)) { echo "</div>"; } ?>
						<?php endforeach; ?>
					</div>
				<?php else: ?>
					<p><?php echo $text_empty_products; ?></p>
				<?php endif; ?>
			</div>
			<?php endforeach; ?>
		</div> <!-- .tab_container_category -->
	</div>
</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".featured-categorytab .owl-demo-tabcate").owlCarousel ({
					autoPlay: <?php if($config_slide['autoplay']) { echo 'true'; } else { echo 'false'; } ?>,
					items : <?php if($config_slide['items']) { echo $config_slide['items']; } else { echo 4; } ?>,
					slideSpeed : <?php if($config_slide['speed']) { echo $config_slide['speed']; } else { echo 3000; } ?>,
					navigation : <?php if($config_slide['shownextback']) { echo 'true'; } else { echo 'false'; } ?>,
					paginationNumbers : true,
					pagination : <?php if($config_slide['shownav']) { echo 'true'; } else { echo 'false'; } ?>,
					stopOnHover : false,
					itemsDesktop : [1199,1],
					itemsDesktopSmall : [991,1],
					itemsTablet: [680,1],
					itemsMobile : [460,1]
				});
				$(".featured-categorytab .featured-category").owlCarousel ({
					autoPlay: <?php if($config_slide['autoplay']) { echo 'true'; } else { echo 'false'; } ?>,
					items : <?php if($config_slide['items']) { echo $config_slide['items']; } else { echo 1; } ?>,
					slideSpeed : <?php if($config_slide['speed']) { echo $config_slide['speed']; } else { echo 3000; } ?>,
					navigation : false,
					paginationNumbers : true,
					pagination : false,
					stopOnHover : false,
					itemsDesktop : [1199,1],
					itemsDesktopSmall : [991,1],
					itemsTablet: [680,1],
					itemsMobile : [460,1]
				});
			});
		</script>
	<?php else: ?>
		<p class="category-not"><?php echo $text_empty_categories; ?></p>
	<?php endif; ?>
<?php endif; ?>




