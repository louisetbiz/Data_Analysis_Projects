# Share of total electricity demand used by data centers - Data package

This data package contains the data that powers the chart ["Share of total electricity demand used by data centers"](https://ourworldindata.org/grapher/data-centers-share-electricity-demand?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website. It was downloaded on July 26, 2026.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For most countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.


## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## Share of total electricity demand coming from data centers
Data center electricity consumption as a share of total electricity demand of the country or region. Data centers power a wide range of online services beyond AI, such as streaming services and cloud storage. The data does not allow a separate estimate for AI use.
Last updated: April 27, 2026  
Next update: April 2027  
Date range: 2020–2025  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
International Energy Agency (2025); International Energy Agency (2026); Ember (2026) – with major processing by Our World in Data

#### Full citation
International Energy Agency (2025); International Energy Agency (2026); Ember (2026) – with major processing by Our World in Data. “Share of total electricity demand coming from data centers” [dataset]. International Energy Agency, “Energy and AI”; Ember, “Yearly Electricity Data Europe”; Ember, “Yearly Electricity Data” [original data].
Source: International Energy Agency (2025), International Energy Agency (2026), Ember (2026) – with major processing by Our World In Data

### What you should know about this data
- This indicator shows what share of a country’s or region’s total electricity demand comes from data centers.
- It covers total data-center electricity use (including cooling and other support systems), across both general-purpose and AI-specialized servers.
- The IEA does not publish a regional aggregate for Eurasia, which includes Russia.

### Sources

#### International Energy Agency – Energy and AI
Retrieved on: 2025-11-07  
Retrieved from: https://www.iea.org/data-and-statistics/data-product/energy-and-ai  

#### Ember – Yearly Electricity Data Europe
Retrieved on: 2026-04-24  
Retrieved from: https://ember-energy.org/data/yearly-electricity-data/  

#### Ember – Yearly Electricity Data
Retrieved on: 2026-04-24  
Retrieved from: https://ember-energy.org/data/yearly-electricity-data/  

#### Notes on our processing step for this indicator
We combine two sources: data center electricity consumption from the IEA (the numerator) and total electricity demand from [Ember](https://ember-energy.org/data/electricity-data-explorer/?tab=main&chart=trend&data=demand&fuel=total) (the denominator).

For each region, we build the denominator by summing Ember's electricity demand across the IEA member countries in that region. For the global estimate, we use Ember's world total directly rather than summing across the IEA's regional aggregates. The IEA does not publish a Eurasia aggregate in this dataset, and Eurasia includes Russia — one of the world's largest electricity consumers — so summing across the IEA regions would exclude Eurasia entirely and undercount global electricity demand.

This produces a global share of approximately 1.5% in 2025, consistent with the IEA's own reporting.


    