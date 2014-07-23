using DataFrames
using HDF5, JLD
using Datetime
using Bokeh
@load "stock_data.jld"

df = DataFrame(date = map(date, stockdata[:AAPL][:Date]))
for (name, df2) in stockdata
  @assert df[:date] == map(date, df2[:Date])
  df[name] = df2[:Open] ./ df2[1, :Open]
end
df[:days] = int(df[:date]) - int(df[1, :date])
println(eltypes(df))

mat = [df[:AAPL] df[:GOOG] df[:FB] df[:MSFT]]

plot(df[:days], mat; title="stocks", height = 400)
showplot("time_stocks.html")

println(Bokeh.DEFAULT_GLYPHS_STR)
println([:AAPL, :GOOG, :FB, :MSFT])

plot(df[:AAPL], df[:GOOG], "bo")
hold(true)
plot(df[:AAPL], df[:FB], "ro")
plot(df[:AAPL], df[:MSFT], "go")
plot(df[:GOOG], df[:FB], "yo")
plot(df[:GOOG], df[:MSFT], "ko")
plot(df[:FB], df[:MSFT], "co"; title="GOOG vs. AAPL, FB, MSFT", height = 400)
showplot("stock_correlation.html")