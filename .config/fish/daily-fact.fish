#!/usr/bin/env fish

# Set the file to store daily facts
set daily_fact_file ~/.daily_fact

function fetch_random_fact
    # Fetch a new random fact
    set random_fact (curl -s 'https://useless-facts.sameerkumar.website/api' | jq -r '.data')
    echo $random_fact
end

function random_fact_of_the_day
    set current_date (date +"%Y-%m-%d")

    # Check if the daily fact file exists
    if test -f $daily_fact_file
        set -l last_date (head -n 1 $daily_fact_file)

        # Check if the last saved date matches the current date
        if test "$last_date" = "$current_date"
            # Read the fact from the file
            set random_fact (sed -n '2,$p' $daily_fact_file)
        else
            # Fetch a new random fact
            set random_fact (fetch_random_fact)

            # Save the current date and fact to the daily fact file
            echo $current_date >$daily_fact_file
            echo $random_fact >>$daily_fact_file
        end
    else
        # Fetch a new random fact if the daily fact file doesn't exist or if --prefetch is specified
        if test "$argv" = --prefetch
            set random_fact (fetch_random_fact)

            # Create and save the daily fact file with the current date and fact
            echo $current_date >$daily_fact_file
            echo $random_fact >>$daily_fact_file
        else
            set random_fact "No fact available. Use 'random_fact --prefetch' to fetch one."
        end
    end

    if test "$argv" = --no-intro
        echo $random_fact
    else
        # Display the random fact of the day
        echo "Random Fact of the Day ($current_date): $random_fact"
    end
end

# Display the random fact of the day when opening the shell
random_fact_of_the_day $argv
