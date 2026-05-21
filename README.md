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

## Machine Learning

Two models were built to test whether book quality can be predicted from structural features alone.

### Rating Prediction (Regression)

Target: `rating` (continuous, 0–5). Model: Random Forest Regressor. The baseline model using 8 structural features produced a negative R², performing worse than simply predicting the mean. Adding two engineered features — `author_book_count` and `is_top_performer` — corrected this.

### Tier Classification

Target: `rating_tier` (10 classes: Tier_1 to Tier_10). Model: Random Forest Classifier. Random guessing on 10 classes produces 10% accuracy. The extended model reached 21.5%.

### Feature Engineering Impact

| Feature set | Regression R² | Classification accuracy |
|---|---|---|
| Baseline (8 features) | -0.275 | 11.3% |
| Extended (+ `author_book_count`, `is_top_performer`) | +0.154 | 21.5% |

The modest results are themselves a finding. Structural features alone are weak predictors of rating, which is consistent with the rating inflation finding from the SQL analysis. The models confirm that title characteristics and author profile carry some signal but cannot reliably determine quality. This supports using these features as secondary filters on a platform rather than primary ranking signals.

---

## Files

```
├── GOODREADS_dataset_cleaned.csv       # Feature-engineered dataset (24 columns)
├── GOODREADS_dataset_cleaned.ipynb     # Data cleaning and feature engineering notebook
├── Goodreads_ML_Project_v2.ipynb       # Machine learning notebook
├── goodreads_analysis_queries.sql      # All SQL queries used in the analysis
├── goodreads_dashboard.png             # Tableau dashboard screenshot
└── README.md
```

---

## Dataset Columns

| Column | Description |
|---|---|
| `rank` | Book rank (1 = highest rated) |
| `percentile_rank` | Percentile position (0 = best, 100 = worst) |
| `rating` | Goodreads rating (0–5) |
| `rating_category` | Excellent / Good / Fair / Poor |
| `rating_tier` | Tier_1 (lowest) to Tier_10 (highest) |
| `is_high_rated` | True if rating >= 4.0 |
| `estimated_popularity` | High / Above Average / Average / Below Average / Low |
| `title_length` | Character count of title |
| `title_complexity` | Simple / Moderate / Complex / Very Complex |
| `title_type` | Standard / Subtitle / Series |
| `has_series_info` | True if book belongs to a series |
| `series_number` | Position in series (if applicable) |
| `author_count` | Number of authors |
| `author_book_count` | How many books this author has in the dataset |
| `is_top_performer` | True if book is in the top 10% by rank |

---

## Tools

- Python: Pandas, NumPy, scikit-learn, Matplotlib, Seaborn
- SQL: PostgreSQL via DBeaver
- Visualisation: Tableau
- Environment: Jupyter Notebook

---

## How to Run

1. Clone this repo
2. Install dependencies: `pip install pandas scikit-learn matplotlib seaborn notebook`
3. Open `GOODREADS_dataset_cleaned.ipynb` for data cleaning and feature engineering
4. Open `Goodreads_ML_Project_v2.ipynb` for the machine learning models
5. Open `goodreads_analysis_queries.sql` in DBeaver and run against the `goodreads_db` PostgreSQL database

---

## Notes

- Raw data sourced from Kaggle — Goodreads books dataset
- Excel was used alongside Python for cleaning verification
- SQL analysis conducted in PostgreSQL via DBeaver
- ML notebook v2 includes a feature engineering iteration with measurable improvement over the baseline
