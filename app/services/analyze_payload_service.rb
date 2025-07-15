class AnalyzePayloadService < ApplicationService
  attr_reader :payload, :client

  def initialize(payload:)
    @payload = payload
    @client = OpenAI::Client.new
  end

  def call
    response = client.chat(
      parameters: {
        model: "gpt-4o",
        response_format: { type: "json_object" },
        messages: [ {
          role: "user", content:
        } ]
      }
    )

    content = response.dig("choices", 0, "message", "content")

    JSON.parse(content).transform_keys do |key|
      key.underscore.to_sym
    end
  end

  def content
    %Q(
      Please analyze the following Shopee review and return structured insights based on the fields listed below.

      The review data is provided in JSON format:
      ```json
      {
        "Comment": "Chất lượng sản phẩm: không thể nào chê vào đâu được nữa ,chất lượng thực sự kkkk",
        "ProductName": "Loa Bluetooth Chữ G Led RGB, REMI OFFICIAL Sạc Nhanh Không Dây, Đèn Nháy Theo Nhạc, Thiết Kế Sang Trọng",
        "BoughtProducts": ["Loa Bluetooth Chữ G Led RGB, REMI OFFICIAL Sạc Nhanh Không Dây, Đèn Nháy Theo Nhạc, Thiết Kế Sang Trọng, Loa G Đồng Hồ"],
        "DetailRating": "product_quality: 5\nseller_service: 5\ndelivery_service: 5",
        "SubCategory": "Loa"
      }
      ```
      The corresponding review images are also provided.

      ---

      Return only the following fields in **JSON format**:

      * **ProductType**: What type of product is being reviewed?

      * **UseCaseContext**: What is the inferred or mentioned use context (e.g., for bedroom decor, parties, desk use, gifting)?

      * **CommentSummary**: Briefly summarize what the comment says about the product (e.g., very good, defective, etc.).

      * **CommentRelatedToProduct**: `true` or `false` — Does the comment clearly refer to the purchased product?

      * **CommentRelatedToProductReasoning**: Brief explanation of how you determined whether the comment is related to the product.

      * **ProductMatchingConfidence**: A confidence score from 0 to 100 indicating how well the comment and images match the product name and description.

      * **ImagesRelatedToProduct**: `true`, `false`, or `null` — Are the images likely related to the product? If no images are available, return `NULL`.

      * **ImagesRelatedToProductReasoning**: Briefly explain how you determined whether the images match the product.

      * **CommentTone**: One of `positive`, `negative`, or `neutral`.

      * **ToneReasoning**: Explain why you selected that tone.

      * **ProductRating**: Overall rating of the product if available (can be derived from the `DetailRating` field).

      * **ToneRatingConsistency**: `true` or `false` — Does the tone of the comment align with the rating?

      * **MentionedFeatures**: List specific features mentioned in the comment (e.g., sound quality, lighting, wireless charging).

      * **EmotionalKeywords**: Extract words or phrases that express sentiment or emotion (e.g., "thực sự", "kkk", "tuyệt vời").

      * **PotentialConcernsMentioned**: Detect any concerns or minor issues implied in the comment, even if the overall tone is positive.

      * **DeliveryExperienceMentioned**: `true` or `false` — Does the comment mention the delivery experience?

      * **DeliveryExperienceMentionedReasoning**: Explain how you determined whether delivery experience was mentioned.

      * **SellerMentioned**: `true` or `false` — Does the reviewer mention the seller (e.g., “shop dễ thương”)?

      * **SellerMentionedReasoning**: Explain how you determined whether the seller was mentioned.

      * **LikelyToRecommend**: `true` or `false` — Based on expressions like “rất đáng mua,” “sẽ giới thiệu,” etc., does the reviewer seem likely to recommend this product?

      * **LikelyToRecommendReasoning**: Explain how you determined the recommendation likelihood.

      ---
    )
  end
end
