using DataFrames
using HDF5, JLD
using Datetime
using Bokeh
autoopen(true)
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

println(Bokeh.DEFAULT_GLYPHS_STR)
println([:AAPL, :GOOG, :FB, :MSFT])