module 0x1::Epoch {

    use 0x1::ConsensusConfig;
    use 0x1::Epoch;
    use 0x1::Event;
    use 0x1::Option;

    struct Epoch has key {
        number: u64,
        start_time: u64,
        start_block_number: u64,
        end_block_number: u64,
        block_time_target: u64,
        reward_per_block: u128,
        reward_per_uncle_percent: u64,
        block_difficulty_window: u64,
        max_uncles_per_block: u64,
        block_gas_limit: u64,
        strategy: u8,
        new_epoch_events: Event::EventHandle<Epoch::NewEpochEvent>,
    }
    struct EpochData has key {
        uncles: u64,
        total_reward: u128,
        total_gas: u128,
    }
    struct NewEpochEvent has drop, store {
        number: u64,
        start_time: u64,
        start_block_number: u64,
        end_block_number: u64,
        block_time_target: u64,
        reward_per_block: u128,
        previous_epoch_total_reward: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun adjust_epoch(a0: &signer, a1: u64, a2: u64, a3: u64, a4: u64): u128;
    native public fun block_gas_limit(): u64;
    native public fun block_time_target(): u64;
    native public fun compute_gas_limit(a0: &ConsensusConfig::ConsensusConfig, a1: u64, a2: u64, a3: u64, a4: u128): Option::Option<u64>;
    native public fun compute_next_block_time_target(a0: &ConsensusConfig::ConsensusConfig, a1: u64, a2: u64, a3: u64, a4: u64, a5: u64, a6: u64): u64;
    native public fun end_block_number(): u64;
    native public fun initialize(a0: &signer);
    native public fun number(): u64;
    native public fun start_block_number(): u64;
    native public fun start_time(): u64;
    native public fun total_gas(): u128;
    native public fun uncles(): u64;

}
