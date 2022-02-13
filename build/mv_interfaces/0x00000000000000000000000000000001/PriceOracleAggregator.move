module 0x1::PriceOracleAggregator {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun latest_price_average_aggregator<T0: copy+ drop+ store>(a0: &vector<address>, a1: u64): u128;

}
