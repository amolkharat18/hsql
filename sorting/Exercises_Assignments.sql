-- Exercise1_Sorting_PCategory_Review

SELECT 
    productid,
    pcategory,
    brand
FROM product
WHERE pcategory IN ('Clothing', 'Accessories')
ORDER BY 
    CASE pcategory
        WHEN 'Accessories' THEN 1
        WHEN 'Clothing' THEN 2
    END,
    review;


-- Exercise2_Sorting_PCategory_Color

SELECT 
    productid,
    pcategory,
    brand,
    color
FROM product
ORDER BY 
    pcategory DESC,
    color ASC;


-- Assignment1_Sorting_Rating_Name

SELECT 
    PublisherId,
    PublisherName,
    Rating
FROM Publisher
ORDER BY 3 ASC, 2 ASC;

-- Assignment2_Sorting_Duration_StartDate

SELECT
    SubscriptionId,
    DurationInMonths,
    DiscountPercent
FROM Subscription
WHERE DurationInMonths > 6
ORDER BY DurationInMonths ASC,
         StartDate DESC;
