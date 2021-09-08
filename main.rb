require 'rest-client'
require 'json'

def main
    puts "Este programa mostra a cotação do dolár a cada 30 segundos"
    puts "Deseja ver a cotação de outras moedas?(y/n)"
    usr_c = gets.chomp

    if usr_c == 'y'
        while true do
            sleep 30
            url = 'https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL'
            response = RestClient.get(url)
            btc = JSON.parse(response.body)['BTCBRL']['bid']
            eur = JSON.parse(response.body)['EURBRL']['bid']
            usd = JSON.parse(response.body)['USDBRL']['bid']
            puts "------------------------------------\n1. BTC: #{btc}\n2. EUR: #{eur}\n3. USD: #{usd}\n------------------------------------"
        end
    else
        while true do
            sleep 30
            url = 'https://economia.awesomeapi.com.br/last/USD-BRL'
            response = RestClient.get(url)
            usd = JSON.parse(response.body)['USDBRL']['bid']
            puts "-----------------------\nUSD: #{usd}\n-----------------------"
        end
    end
end
main