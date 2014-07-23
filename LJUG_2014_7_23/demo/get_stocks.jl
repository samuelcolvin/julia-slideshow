using DataFrames
using Requests
using HDF5, JLD

function quandl(code, market = :NASDAQ)
  url = "http://www.quandl.com/api/v1/datasets/GOOG/$(market)_$code.csv?sort_order=asc"
  url *= "&trim_start=2012-06-01&trim_end=2014-06-01&auth_token=6YzXnhcc8KU6zC9Y8oqh"
  response = get(url)
  if response.status != 200
    error("error getting data\n    url: $url\n     response: $(response.data)")
  end
  println("got url: $url\nresponse length: $(length(response.data))")
  readtable(IOBuffer(response.data))
end
stockdata = Dict{Symbol, DataFrame}()
for code in [:AAPL, :GOOG, :FB, :MSFT]
  df = quandl(code)
  show(df)
  println()
  stockdata[code] = df
end
@save "stock_data.jld" stockdata