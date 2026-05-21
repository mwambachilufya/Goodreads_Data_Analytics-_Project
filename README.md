# Goodreads Books Data Science Project

A data science project built on a Kaggle dataset of 3,045 Goodreads books, with the goal of determining whether a publishing house should partner with an existing platform like Goodreads in order to market their books or to build a new one where their books can be found exclusively.

---


## Dashboard

![Goodreads Books Analysis Dashboard](Goodreads%20Queries/goodreads%20dashboard%20screenshot.png)

The dashboard shows areas of focus that were investigated in order to detrmine whether the publishing house should partner with goodreads or create their own platform. These are ratings, types of readers, popularity, types of books and, categories of books. 

## Rating Distribution

60% of the 3,045 books in the dataset are rated Excellent this means they carry a rating of 4.0 or above. Only 3 books fall below Good. The average rating sits at 4.06 out of 5 with a median of 4.07. This means that the data is concenttrated and leans towards the top. Most ratings are excellent this could mean that users can be engaged and excited about a reader's work once they love it.This would be encouraging for a publisher and creates a good environment around an authors work. 

---

## Popularity vs Rating

High popularity books average 4.42 stars. Low popularity books average 3.67 stars. The 0.74 gap across the five popularity values is consistent and visible in the chart, with the overall average reference line at 4.058 between the Average and Above Average. This means books that rate well get discovered and are made popular and it also works in such a way that popular books tend to have higher ratings. This is a good argument to partner with goodreads rather than build ones on platform. The community is already there and all is needed is to have a good enough book that has a good rating and it will be discovered such is the benefit of the discoverability on goodreads.

---

## Series by Rank

Series books account for 37.5% of the full dataset and average 4.084 stars compared to 4.042 for standalone titles. The more interesting finding is how series books are distributed across rank groups. They peak in the 1001–2000 rank range at 426 books, not in the top 500 as might be expected. The top 500 contains 178 series books versus 322 standalone titles. So series make up the majority of the mid to lower ranked books which is still good, particularly because reading a series of books requires some levvel of community to know what book is better in a series or what to read next. If the publishing house is known for publishing series this would encourage them because there will be engagemet for their books.

---

## Title Complexity

Books with Complex and Very Complex titles average 4.13 stars, compared to 3.99 for Simple titles. Moderate titles sit at the overall average of 4.06. The reference line at 4.058 makes the split clear: complexity above Moderate correlates with above-average ratings and complexity that is at or below Moderate does not.This says more about the kind of readers that are found on goodreads. The more intellectual and engaging kind of readers. This the publishing house determine what type of books will garner much ratings. 

---

## Tier Distribution

The 3,045 books are distributed across 10 rating tiers, with counts ranging from 270 in Tier_7 to 344 in Tier_3. No single tier dominates. The range across all ten tiers is just 74 books. This even distribution confirms that the dataset represents the full quality spectrum rather than being skewed toward top performers. This is good news that even though the publishing house may at times publish books that are low quality they may still get discovered and rated. They will still get an audience. This is good representation and such representation and marketing would take years if the publishing house decided to build their own platform. 

---

## Recommendation

The data supports a partnership approach rather than a full platform rebuild. Goodreads has the following advantages: a) There is equal representation and marketing of books despite the quality. As shown in the tier distribution chart. Even if the representation is smaller goodreads has such a wide readersip built over many years that their is guranteed engagement with all types of books so there will be representation and marketing opportunites. b) Potential for widespread popularity if a book is rated higher. if the publishng house has a very highly rated book the chances are higher that it will become popular and more popularity will increase ratings. purely from a marketing standpoint this is a golden opportunity as this could lead to actual sales in physical copies or purchases online on plaatforms like Amazon. c) The community is present but also higly intellectual and engaging. Valuable information for what kinds of people you find on the platform. ALso, what the publishing house can focus on marketing. 

This data is by no means exhaustive and high ratings may not vouch for the quality of the book from a subjective stanpoint. But from a publishing house marketing perspective this info could at least guide the authorities and what decisions to make in regard to what types of books to accept and what to publish.

---

# Goodreads Books — End-to-End Data Science Project

A full data science pipeline built on a Kaggle dataset of 3,045 Goodreads books. The project is framed from the perspective of a publishing house deciding whether to use Goodreads as a marketing and distribution channel for its titles.

---

## Project Overview

| Stage | Tool | Output |
|---|---|---|
| Data collection | Kaggle | Raw dataset (3,045 books) |
| Data cleaning | Python + Excel | `goodreads_books_cleaned.csv` |
| Feature engineering | Python (Pandas) | `GOODREADS_dataset_cleaned.csv` |
| SQL analysis | PostgreSQL (DBeaver) | 5 business insights |
| Dashboard | Tableau | `goodreads_dashboard.png` |
| Machine learning | Python (scikit-learn) | Rating and tier prediction models |

---

## Business Question

> Should the publishing house partner with Goodreads to market its titles, or invest in building a proprietary reader platform from the ground up?

The SQL analysis examines the platform itself — how ratings work, how popularity is distributed, how series content performs — to determine whether Goodreads is the right environment to invest in. The machine learning section then asks the operational follow-up: once the publishing house commits to Goodreads, can it predict how its books will perform on the platform before allocating marketing budget?

---

## Dashboard

![Goodreads Books Analysis Dashboard](goodreads_dashboard.png)

The dashboard brings together the five analyses into a single view. Each chart addresses a specific dimension of the platform question — from how ratings are distributed, to how popularity relates to quality, to how series books behave across rank groups. The charts are discussed individually below.

---

## Rating Distribution

60% of the 3,045 books in the dataset are rated Excellent, meaning they carry a rating of 4.0 or above. Only 3 books fall below Good. The average rating sits at 4.06 out of 5, with a median of 4.07 — confirming the distribution is not normal but heavily skewed toward the top end. This is not a reflection of exceptional book quality across the board. It reflects a well-documented bias in user-generated rating systems where readers tend to rate books they finished and enjoyed, leaving unread or abandoned books unrated. For a publishing house, this is useful context: the Goodreads rating environment is forgiving, and most titles that make it onto the platform settle into the Good-to-Excellent band rather than the bottom of the scale.

---

## Popularity vs Rating

High popularity books average 4.42 stars. Low popularity books average 3.67 stars. The 0.74 gap across the five popularity tiers is consistent and visible in the chart, with the overall average reference line at 4.058 sitting between the Average and Above Average tiers. This relationship confirms that Goodreads' recommendation engine has broadly matched quality content to popular audiences — books that rate well tend to be the ones readers find and engage with. The ceiling for Low popularity books is 3.84, meaning no genuinely high-quality book is being buried by the algorithm. This is an argument in favour of partnership rather than a full rebuild. The discovery infrastructure is functional and would be expensive to replicate from scratch.

---

## Series by Rank

Series books account for 37.5% of the full dataset and average 4.084 stars compared to 4.042 for standalone titles. The more interesting finding is how series books are distributed across rank groups. They peak in the 1001–2000 rank range at 426 books, not in the top 500 as might be expected. The top 500 contains 178 series books versus 322 standalone titles. This suggests that series readership drives sustained mid-tier engagement rather than top-end ratings. Readers who commit to a series rate consistently but not necessarily at the highest levels. A publishing house with a strong series catalog has a defined audience to reach on Goodreads, particularly in the mid-tier range where series content concentrates.

---

## Title Complexity

Books with Complex and Very Complex titles average 4.13 stars, compared to 3.99 for Simple titles. Moderate titles sit at the overall average of 4.06. The reference line at 4.058 makes the split clear: complexity above Moderate correlates with above-average ratings, complexity at or below Moderate does not. This is not a causal relationship between title length and quality. It reflects genre composition. Academic texts, literary non-fiction, and specialist books carry longer, more structured titles and attract audiences who rate deliberately and with high standards. For the publishing house, this suggests that more complex or specialist titles will land in a more rating-favourable audience segment on Goodreads.

---

## Tier Distribution

The 3,045 books are distributed across 10 rating tiers, with counts ranging from 270 in Tier_7 to 344 in Tier_3. No single tier dominates. The range across all ten tiers is just 74 books. This even distribution confirms that the dataset represents the full quality spectrum rather than being skewed toward top performers. For the partnership decision, this breadth is significant — Goodreads holds books at every quality level, meaning the publishing house's titles will find their place in the catalog regardless of where they fall on the quality scale.

---

## Recommendation

The data supports a partnership approach rather than a full platform rebuild. Goodreads holds two assets that would take years to replicate: a large, well-distributed catalog and a recommendation engine that has broadly matched quality to popular audiences. What it does not offer is an honest rating system, meaningful series UX, or granular genre segmentation. These are weaknesses the publishing house should be aware of but they do not warrant building a competing platform from scratch. The most efficient path is partnership: market titles on Goodreads, use the existing community infrastructure, and benefit from the established discovery patterns the analysis identified.

---

## Machine Learning

With the partnership recommendation established through the SQL analysis, the next operational question is whether the publishing house can predict how its books will perform on Goodreads before committing marketing budget. Three algorithms were tested: Linear Regression as an interpretable baseline, Random Forest as a tree ensemble, and Gradient Boosting as a sequential ensemble. All models used only structural features available before a book accumulates reader ratings — title length, word count, author name length, series position, author book count, and related metadata.

A leakage audit was conducted before modelling. Several columns in the dataset — including `is_top_performer`, `estimated_popularity`, `rank`, and `percentile_rank` — are mathematically derived from the rating itself. Using them as predictors produces artificially inflated results. All were excluded from the final feature set.

### Model Performance

![Model comparison](ml_model_comparison.png)

Gradient Boosting is the only model that meaningfully beats the naive baseline, explaining roughly 9.4% of the variance in book ratings. Random Forest overfits on this small, low-signal dataset and produces a negative R², performing worse than simply predicting the average rating for every book. Linear Regression captures a small amount of signal at R² of 0.047. The dashed line at zero is the reference point — anything to the right is doing real work, anything to the left is not.

### What Drives the Predictions

![Feature importance](ml_feature_importance.png)

Title length is the single strongest signal at 0.320, followed by word count at 0.185 and author name length at 0.173. Series position and author book count round out the top five. Title complexity — which the dashboard analysis identified as a visible differentiator between rating categories — ranks near the bottom at 0.014. Its dashboard-level effect is real but small, and is largely captured by the more granular title length and word count features.

### Recommendation

The modelling confirms that structural metadata alone is not a reliable enough signal to automate marketing decisions. The best model explains less than 10% of why books receive the ratings they do on Goodreads. The remaining 90% is driven by the actual content, reader experience, timing, and community dynamics that no pre-publication metadata can capture.

This does not weaken the partnership case — it refines it. The publishing house should partner with Goodreads for catalog reach and community infrastructure, but marketing budget allocation should remain a human decision informed by editorial judgement and early reader feedback rather than a model output. The structural signals identified here — title length, author profile, and series position — can serve as secondary grouping tools but not as primary quality predictors.

---
