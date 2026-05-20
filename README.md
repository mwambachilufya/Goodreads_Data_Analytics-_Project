# Goodreads Books Data Science Project

A data science project built on a Kaggle dataset of 3,045 Goodreads books, with the goal of determining whether a publishing house should partner with an existing platform like Goodreads in order to market their books or to build a new one where their books can be found exclusively.

---


## Dashboard

![Goodreads Books Analysis Dashboard](Goodreads%20Queries/goodreads%20dashboard%20screenshot.png)

---


---

## Rating Distribution

60% of the 3,045 books in the dataset are rated Excellent, meaning they carry a rating of 4.0 or above. Only 3 books fall below Good. The average rating sits at 4.06 out of 5, with a median of 4.07 — confirming the distribution is not normal but heavily skewed toward the top end. This is not a reflection of exceptional book quality across the board. It reflects a well-documented bias in user-generated rating systems where readers tend to rate books they finished and enjoyed, leaving unread or abandoned books unrated. Any platform built on Goodreads rating data inherits this ceiling effect. A new platform could address this by requiring a minimum read percentage before a rating is accepted, or by separating completion rates from quality scores.

---

## Popularity vs Rating

High popularity books average 4.42 stars. Low popularity books average 3.67 stars. The 0.74 gap across the five popularity tiers is consistent and visible in the chart, with the overall average reference line at 4.058 sitting between the Average and Above Average tiers. This relationship confirms that Goodreads' recommendation engine has broadly matched quality content to popular audiences — books that rate well tend to be the ones readers find and engage with. The ceiling for Low popularity books is 3.84, meaning no genuinely high-quality book is being buried by the algorithm. This is an argument in favour of partnership rather than a full rebuild. The discovery infrastructure is functional and would be expensive to replicate from scratch.

---

## Series by Rank

Series books account for 37.5% of the full dataset and average 4.084 stars compared to 4.042 for standalone titles. The more interesting finding is how series books are distributed across rank groups. They peak in the 1001–2000 rank range at 426 books, not in the top 500 as might be expected. The top 500 contains 178 series books versus 322 standalone titles. This suggests that series readership drives sustained mid-tier engagement rather than top-end ratings. Readers who commit to a series rate consistently but not necessarily at the highest levels. A platform targeting this audience would benefit from series tracking features — reading progress, next-book prompts, and series completion indicators — which Goodreads supports but does not prioritise in its core UX.

---

## Title Complexity

Books with Complex and Very Complex titles average 4.13 stars, compared to 3.99 for Simple titles. Moderate titles sit at the overall average of 4.06. The reference line at 4.058 makes the split clear: complexity above Moderate correlates with above-average ratings, complexity at or below Moderate does not. This is not a causal relationship between title length and quality. It reflects genre composition. Academic texts, literary non-fiction, and specialist books carry longer, more structured titles and attract audiences who rate deliberately and with high standards. Title complexity functions as a lightweight genre proxy. A platform with deeper genre architecture could use this signal to segment content without requiring full manual tagging of every title in the catalog.

---

## Tier Distribution

The 3,045 books are distributed across 10 rating tiers, with counts ranging from 270 in Tier_7 to 344 in Tier_3. No single tier dominates. The range across all ten tiers is just 74 books. This even distribution confirms that the dataset represents the full quality spectrum rather than being skewed toward top performers. For the platform decision, this breadth is significant. A catalog with genuine representation at every quality level provides the raw material for a tiered recommendation system — one that onboards new users with Tier_8 to Tier_10 books and progressively surfaces mid-tier content as taste profiles develop. Goodreads holds this catalog. Building an equivalent from scratch would require years of community engagement to accumulate.

---

## Recommendation

The data supports a partnership approach rather than a full platform rebuild. Goodreads holds two assets that would take years to replicate: a large, well-distributed catalog and a recommendation engine that has broadly matched quality to popular audiences. What it does not offer is an honest rating system, meaningful series UX, or granular genre segmentation. These are buildable features on top of an existing infrastructure. The most efficient path is to access Goodreads data through its API and build a differentiated product layer — with structured rating prompts, series progression tracking, and complexity-based genre tagging — rather than competing with the catalog from zero.

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
