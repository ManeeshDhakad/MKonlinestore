
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
    	
                <a class="common-btn-border a-text-decoration" href="#reviews-anchor" id="open-review-box">Leave a Review</a>
            
            <div class="row" id="post-review-box" style="display:none;">
                <div class="col-md-12">
                    	<p id="reviewMessage" style="display: none"></p>
                        <input id="reviewRating" name="rating" type="hidden"> 
                        <textarea class="common-input-textarea animated"  id="reviewComment" name="comment" placeholder="Enter your review here" rows="5"></textarea>
        				<div id="reviwStars" class="text-right stars starrr" style="margin: 20px 0px 20px 0px" data-rating="0"></div>
                        <div class="row">
                        	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            	<button class="common-btn" type="submit" onclick="saveReview(); return false;">Save Review</button>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            	<button class="common-btn" id="close-review-box" style="display:none; margin-right: 10px;">
                            	<span class="glyphicon glyphicon-remove"></span>Cancel</button>
                            </div>
                        </div>
                        
                    
                </div>
            </div>
		</div>
	</div>
