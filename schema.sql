-- 11footy dataset, VDF 1: the tables and views of every file of the release

CREATE TABLE applied_corrections (match_id INTEGER, fact TEXT, value_before TEXT, value_after TEXT, applied_at TEXT);

CREATE TABLE competitions (competition_id INTEGER, code TEXT, name TEXT, country TEXT, kind TEXT, time_zone TEXT, first_season INTEGER, tier INTEGER, PRIMARY KEY (competition_id));

CREATE TABLE format_version (version TEXT NOT NULL, dataset TEXT NOT NULL, part TEXT NOT NULL, scope TEXT NOT NULL, built_at TEXT NOT NULL, licence TEXT NOT NULL);

CREATE TABLE head_to_head (team_id_a INTEGER, team_id_b INTEGER, competition_id INTEGER, matches INTEGER, wins_a INTEGER, draws INTEGER, wins_b INTEGER, goals_a INTEGER, goals_b INTEGER, last_match_id INTEGER, PRIMARY KEY (team_id_a, team_id_b, competition_id));

CREATE TABLE match_events (event_id INTEGER, match_id INTEGER, sequence INTEGER, period INTEGER, minute INTEGER, added_minute INTEGER, clock_seconds INTEGER, wall_clock_utc TEXT, kind TEXT, detail TEXT, team_id INTEGER, related_team_id INTEGER, player_id INTEGER, related_player_id INTEGER, shot_id INTEGER, score_home_after INTEGER, score_away_after INTEGER, layer TEXT, PRIMARY KEY (event_id));

CREATE TABLE match_officials (match_id INTEGER, referee_id INTEGER, role TEXT, PRIMARY KEY (match_id, referee_id, role));

CREATE TABLE match_players (match_id INTEGER, team_id INTEGER, player_id INTEGER, started INTEGER, on_bench INTEGER, shirt_number INTEGER, position_code TEXT, position_group TEXT, formation_slot INTEGER, minute_on INTEGER, minute_off INTEGER, minutes_played INTEGER, sent_off INTEGER, PRIMARY KEY (match_id, team_id, player_id));

CREATE TABLE match_team_sheets (match_id INTEGER, team_id INTEGER, formation TEXT, captain_player_id INTEGER, starters_count INTEGER, bench_count INTEGER, PRIMARY KEY (match_id, team_id));

CREATE TABLE match_team_statistics (match_id INTEGER, team_id INTEGER, layer TEXT, shots INTEGER, shots_on_target INTEGER, shots_blocked INTEGER, corners INTEGER, fouls INTEGER, offsides INTEGER, yellow_cards INTEGER, red_cards INTEGER, possession_percent REAL, passes INTEGER, accurate_passes INTEGER, crosses INTEGER, accurate_crosses INTEGER, long_balls INTEGER, accurate_long_balls INTEGER, tackles INTEGER, effective_tackles INTEGER, interceptions INTEGER, clearances INTEGER, effective_clearances INTEGER, saves INTEGER, penalties_taken INTEGER, penalties_scored INTEGER, woodwork INTEGER, PRIMARY KEY (match_id, team_id, layer));

CREATE TABLE match_ties (tie_id INTEGER, season_id INTEGER, stage TEXT, first_leg_match_id INTEGER, second_leg_match_id INTEGER, winner_team_id INTEGER, decided_by TEXT, PRIMARY KEY (tie_id));

CREATE TABLE matches (match_id INTEGER, season_id INTEGER, competition_code TEXT, competition_name TEXT, stage TEXT, group_name TEXT, league_name TEXT, matchday INTEGER, leg INTEGER, tie_id INTEGER, kickoff_utc TEXT, kickoff_precision TEXT, local_date TEXT, home_team_id INTEGER, away_team_id INTEGER, neutral_venue INTEGER, venue_id INTEGER, attendance INTEGER, status TEXT, home_goals INTEGER, away_goals INTEGER, home_goals_on_pitch INTEGER, away_goals_on_pitch INTEGER, home_goals_half_time INTEGER, away_goals_half_time INTEGER, home_goals_regular_time INTEGER, away_goals_regular_time INTEGER, extra_time_played INTEGER, shootout_home_goals INTEGER, shootout_away_goals INTEGER, winner_team_id INTEGER, PRIMARY KEY (match_id));

CREATE TABLE penalty_shootouts (match_id INTEGER, sequence INTEGER, team_id INTEGER, player_id INTEGER, scored INTEGER, PRIMARY KEY (match_id, sequence));

CREATE TABLE player_absences (absence_id INTEGER, player_id INTEGER, team_id INTEGER, kind TEXT, certainty TEXT, from_date TEXT, expected_until TEXT, ended_on TEXT, sources_count INTEGER, recorded_at TEXT, basis TEXT, PRIMARY KEY (absence_id));

CREATE TABLE player_match_event_counts (match_id INTEGER, team_id INTEGER, player_id INTEGER, attempts INTEGER, attempts_on_target INTEGER, attempts_blocked INTEGER, attempts_off_target INTEGER, attempts_woodwork INTEGER, attempts_inside_box INTEGER, attempts_outside_box INTEGER, headed_attempts INTEGER, goals INTEGER, assists INTEGER, penalties_taken INTEGER, penalties_scored INTEGER, penalties_won INTEGER, penalties_conceded INTEGER, fouls_committed INTEGER, fouls_suffered INTEGER, offsides INTEGER, corners_conceded INTEGER, yellow_cards INTEGER, red_cards INTEGER, substituted_on_minute INTEGER, substituted_off_minute INTEGER, big_chances INTEGER, PRIMARY KEY (match_id, team_id, player_id));

CREATE TABLE player_match_statistics (match_id INTEGER, team_id INTEGER, player_id INTEGER, minutes_played INTEGER, goals INTEGER, assists INTEGER, own_goals INTEGER, shots INTEGER, shots_on_target INTEGER, key_passes INTEGER, fouls_committed INTEGER, fouls_suffered INTEGER, yellow_cards INTEGER, red_cards INTEGER, saves INTEGER, goals_conceded INTEGER, shots_faced INTEGER, offsides INTEGER, appeared INTEGER, came_on INTEGER, PRIMARY KEY (match_id, team_id, player_id));

CREATE TABLE player_merges (retired_id INTEGER, kept_id INTEGER, merged_on TEXT, PRIMARY KEY (retired_id));

CREATE TABLE player_season_totals (season_id INTEGER, team_id INTEGER, player_id INTEGER, appearances INTEGER, starts INTEGER, minutes INTEGER, goals INTEGER, assists INTEGER, own_goals INTEGER, shots INTEGER, shots_on_target INTEGER, key_passes INTEGER, fouls_committed INTEGER, fouls_suffered INTEGER, yellow_cards INTEGER, red_cards INTEGER, saves INTEGER, goals_conceded INTEGER, attempts INTEGER, attempts_on_target INTEGER, penalties_taken INTEGER, penalties_scored INTEGER, PRIMARY KEY (season_id, team_id, player_id));

CREATE TABLE players (player_id INTEGER, name TEXT, short_name TEXT, birth_date TEXT, usual_position_group TEXT, current_team_id INTEGER, current_team_name TEXT, team_as_of TEXT, PRIMARY KEY (player_id));

CREATE TABLE points_deductions (season_id INTEGER, team_id INTEGER, points INTEGER, effective_on TEXT);

CREATE TABLE referees (referee_id INTEGER, name TEXT, country TEXT, PRIMARY KEY (referee_id));

CREATE TABLE seasons (season_id INTEGER, competition_id INTEGER, season INTEGER, name TEXT, first_match_on TEXT, last_match_on TEXT, teams_count INTEGER, status TEXT, format TEXT, matchdays_total INTEGER, PRIMARY KEY (season_id));

CREATE TABLE shots (shot_id INTEGER, match_id INTEGER, team_id INTEGER, player_id INTEGER, assist_player_id INTEGER, period INTEGER, minute INTEGER, added_minute INTEGER, x_m REAL, y_m REAL, goal_mouth_y REAL, result TEXT, situation TEXT, body_part TEXT, is_penalty INTEGER, distance_m REAL, angle_degrees REAL, zone TEXT, zone_side TEXT, layer TEXT, also_in_commentary INTEGER, xg REAL, PRIMARY KEY (shot_id));

CREATE TABLE squad_memberships (player_id INTEGER, team_id INTEGER, from_date TEXT, to_date TEXT, shirt_number INTEGER, PRIMARY KEY (player_id, team_id, from_date));

CREATE TABLE standings (season_id INTEGER, after_matchday INTEGER, team_id INTEGER, played INTEGER, won INTEGER, drawn INTEGER, lost INTEGER, goals_for INTEGER, goals_against INTEGER, goal_difference INTEGER, points INTEGER, position INTEGER, points_deducted INTEGER, league_name TEXT, group_name TEXT, form_last_five TEXT, PRIMARY KEY (season_id, after_matchday, team_id));

CREATE TABLE suspensions_by_rule (player_id INTEGER, team_id INTEGER, competition_id INTEGER, trigger_event_id INTEGER, rule_id TEXT, matches_banned INTEGER, served_in_match_ids TEXT, certainty TEXT, yellow_cards_accumulated INTEGER, PRIMARY KEY (player_id, trigger_event_id));

CREATE TABLE team_season_totals (season_id INTEGER, team_id INTEGER, matches_played INTEGER, won INTEGER, drawn INTEGER, lost INTEGER, goals_for INTEGER, goals_against INTEGER, clean_sheets INTEGER, failed_to_score INTEGER, home_won INTEGER, home_drawn INTEGER, home_lost INTEGER, away_won INTEGER, away_drawn INTEGER, away_lost INTEGER, home_matches_played INTEGER, home_goals_for INTEGER, home_goals_against INTEGER, home_clean_sheets INTEGER, home_failed_to_score INTEGER, away_matches_played INTEGER, away_goals_for INTEGER, away_goals_against INTEGER, away_clean_sheets INTEGER, away_failed_to_score INTEGER, shots INTEGER, shots_on_target INTEGER, corners INTEGER, fouls INTEGER, offsides INTEGER, yellow_cards INTEGER, red_cards INTEGER, PRIMARY KEY (season_id, team_id));

CREATE TABLE teams (team_id INTEGER, name TEXT, short_name TEXT, kind TEXT, country TEXT, city TEXT, founded_year INTEGER, refounded_on TEXT, active_from TEXT, active_to TEXT, colour TEXT, alternate_colour TEXT, colour_luminance REAL, alternate_colour_luminance REAL, PRIMARY KEY (team_id));

CREATE TABLE venues (venue_id INTEGER, name TEXT, city TEXT, country TEXT, capacity INTEGER, home_team_id INTEGER, PRIMARY KEY (venue_id));

CREATE VIEW standings_at_date AS
        SELECT s.season_id, s.team_id, s.played, s.won, s.drawn, s.lost, s.goals_for,
               s.goals_against, s.goal_difference, s.points, s.form_last_five,
               own.local_date AS valid_from
        FROM standings s
        JOIN (SELECT season_id, team_id, local_date,
                     ROW_NUMBER() OVER (PARTITION BY season_id, team_id
                                        ORDER BY kickoff_utc, match_id) AS round
              FROM (SELECT season_id, home_team_id AS team_id, local_date, kickoff_utc, match_id
                    FROM matches
                    WHERE status IN ('played', 'awarded') AND home_goals IS NOT NULL AND (stage IS NULL OR stage <> 'play-off') AND (stage IN ('group stage', 'league phase') OR season_id IN (
        SELECT s.season_id FROM seasons s JOIN competitions c ON c.competition_id = s.competition_id
        WHERE c.kind IN ('league', 'nations league')))
                    UNION ALL
                    SELECT season_id, away_team_id, local_date, kickoff_utc, match_id
                    FROM matches
                    WHERE status IN ('played', 'awarded') AND home_goals IS NOT NULL AND (stage IS NULL OR stage <> 'play-off') AND (stage IN ('group stage', 'league phase') OR season_id IN (
        SELECT s.season_id FROM seasons s JOIN competitions c ON c.competition_id = s.competition_id
        WHERE c.kind IN ('league', 'nations league'))))) own
          ON own.season_id = s.season_id AND own.team_id = s.team_id AND own.round = s.played
        WHERE s.after_matchday = s.played;
