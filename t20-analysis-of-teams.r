{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "872d2e4c",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:14.891566Z",
     "iopub.status.busy": "2023-02-20T20:07:14.888975Z",
     "iopub.status.idle": "2023-02-20T20:07:16.361737Z",
     "shell.execute_reply": "2023-02-20T20:07:16.360037Z"
    },
    "papermill": {
     "duration": 1.481526,
     "end_time": "2023-02-20T20:07:16.364117",
     "exception": false,
     "start_time": "2023-02-20T20:07:14.882591",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'intl-cricketer-stats-odi-t20-tests'"
      ],
      "text/latex": [
       "'intl-cricketer-stats-odi-t20-tests'"
      ],
      "text/markdown": [
       "'intl-cricketer-stats-odi-t20-tests'"
      ],
      "text/plain": [
       "[1] \"intl-cricketer-stats-odi-t20-tests\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "ef6f1cf5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:16.400964Z",
     "iopub.status.busy": "2023-02-20T20:07:16.371971Z",
     "iopub.status.idle": "2023-02-20T20:07:16.442346Z",
     "shell.execute_reply": "2023-02-20T20:07:16.440763Z"
    },
    "papermill": {
     "duration": 0.077344,
     "end_time": "2023-02-20T20:07:16.444670",
     "exception": false,
     "start_time": "2023-02-20T20:07:16.367326",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: timechange\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(ggplot2)\n",
    "library(dplyr)\n",
    "library(lubridate)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "9fa00745",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:16.454573Z",
     "iopub.status.busy": "2023-02-20T20:07:16.452979Z",
     "iopub.status.idle": "2023-02-20T20:07:17.118107Z",
     "shell.execute_reply": "2023-02-20T20:07:17.115951Z"
    },
    "papermill": {
     "duration": 0.672424,
     "end_time": "2023-02-20T20:07:17.120556",
     "exception": false,
     "start_time": "2023-02-20T20:07:16.448132",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m12\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m2\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): country\n",
      "\u001b[32mdbl\u001b[39m (1): id\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m666\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m7\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (5): name, gender, bating_style, bowling_style, playing_role\n",
      "\u001b[32mdbl\u001b[39m (2): id, country_id\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m327\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (2): span, high_score\n",
      "\u001b[32mdbl\u001b[39m (13): id, matches, innings, not_out, runs, average_score, ball_faced, st...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m347\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m18\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (3): sp, bbi, bbm\n",
      "\u001b[32mdbl\u001b[39m (13): id, bwa, bwe, bwsr, cd, fw, fwk, in, md, mt, ov, tw, wk\n",
      "\u001b[33mlgl\u001b[39m  (2): bl, pr\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m327\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m14\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (3): bbi, hs, sp\n",
      "\u001b[32mdbl\u001b[39m (10): id, bbad, bta, bwa, ct, fw, hn, rn, st, wk\n",
      "\u001b[33mlgl\u001b[39m  (1): pr\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "#reading the required files\n",
    "df<-read_csv(\"../input/intl-cricketer-stats-odi-t20-tests/country.csv\")\n",
    "df1<-read_csv(\"../input/intl-cricketer-stats-odi-t20-tests/all_players.csv\")\n",
    "df2<-read_csv(\"../input/intl-cricketer-stats-odi-t20-tests/t20_batting.csv\")\n",
    "df3<-read_csv(\"../input/intl-cricketer-stats-odi-t20-tests/t20_bowling.csv\")\n",
    "df4<-read_csv(\"../input/intl-cricketer-stats-odi-t20-tests/t20_all_round.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "2e31a82a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.132638Z",
     "iopub.status.busy": "2023-02-20T20:07:17.130930Z",
     "iopub.status.idle": "2023-02-20T20:07:17.214620Z",
     "shell.execute_reply": "2023-02-20T20:07:17.212939Z"
    },
    "papermill": {
     "duration": 0.092105,
     "end_time": "2023-02-20T20:07:17.216977",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.124872",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>name</th><th scope=col>gender</th><th scope=col>bating_style</th><th scope=col>bowling_style</th><th scope=col>playing_role</th><th scope=col>country_id</th><th scope=col>country</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>935995</td><td>Afif Hossain  </td><td>M</td><td>left-hand bat </td><td>right-arm offbreak   </td><td>allrounder         </td><td>25</td><td>Bangladesh</td></tr>\n",
       "\t<tr><td>380354</td><td>Anamul Haque  </td><td>M</td><td>right-hand bat</td><td>NA                   </td><td>wicketkeeper batter</td><td>25</td><td>Bangladesh</td></tr>\n",
       "\t<tr><td>932355</td><td>Ebadot Hossain</td><td>M</td><td>right-hand bat</td><td>right-arm fast-medium</td><td>bowler             </td><td>25</td><td>Bangladesh</td></tr>\n",
       "\t<tr><td>486995</td><td>Fargana Hoque </td><td>M</td><td>right-hand bat</td><td>NA                   </td><td>top-order batter   </td><td>25</td><td>Bangladesh</td></tr>\n",
       "\t<tr><td>926629</td><td>Hasan Mahmud  </td><td>M</td><td>right-hand bat</td><td>right-arm medium     </td><td>bowler             </td><td>25</td><td>Bangladesh</td></tr>\n",
       "\t<tr><td>927619</td><td>Khaled Ahmed  </td><td>M</td><td>right-hand bat</td><td>right-arm medium     </td><td>bowler             </td><td>25</td><td>Bangladesh</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 8\n",
       "\\begin{tabular}{llllllll}\n",
       " id & name & gender & bating\\_style & bowling\\_style & playing\\_role & country\\_id & country\\\\\n",
       " <dbl> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 935995 & Afif Hossain   & M & left-hand bat  & right-arm offbreak    & allrounder          & 25 & Bangladesh\\\\\n",
       "\t 380354 & Anamul Haque   & M & right-hand bat & NA                    & wicketkeeper batter & 25 & Bangladesh\\\\\n",
       "\t 932355 & Ebadot Hossain & M & right-hand bat & right-arm fast-medium & bowler              & 25 & Bangladesh\\\\\n",
       "\t 486995 & Fargana Hoque  & M & right-hand bat & NA                    & top-order batter    & 25 & Bangladesh\\\\\n",
       "\t 926629 & Hasan Mahmud   & M & right-hand bat & right-arm medium      & bowler              & 25 & Bangladesh\\\\\n",
       "\t 927619 & Khaled Ahmed   & M & right-hand bat & right-arm medium      & bowler              & 25 & Bangladesh\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 8\n",
       "\n",
       "| id &lt;dbl&gt; | name &lt;chr&gt; | gender &lt;chr&gt; | bating_style &lt;chr&gt; | bowling_style &lt;chr&gt; | playing_role &lt;chr&gt; | country_id &lt;dbl&gt; | country &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 935995 | Afif Hossain   | M | left-hand bat  | right-arm offbreak    | allrounder          | 25 | Bangladesh |\n",
       "| 380354 | Anamul Haque   | M | right-hand bat | NA                    | wicketkeeper batter | 25 | Bangladesh |\n",
       "| 932355 | Ebadot Hossain | M | right-hand bat | right-arm fast-medium | bowler              | 25 | Bangladesh |\n",
       "| 486995 | Fargana Hoque  | M | right-hand bat | NA                    | top-order batter    | 25 | Bangladesh |\n",
       "| 926629 | Hasan Mahmud   | M | right-hand bat | right-arm medium      | bowler              | 25 | Bangladesh |\n",
       "| 927619 | Khaled Ahmed   | M | right-hand bat | right-arm medium      | bowler              | 25 | Bangladesh |\n",
       "\n"
      ],
      "text/plain": [
       "  id     name           gender bating_style   bowling_style        \n",
       "1 935995 Afif Hossain   M      left-hand bat  right-arm offbreak   \n",
       "2 380354 Anamul Haque   M      right-hand bat NA                   \n",
       "3 932355 Ebadot Hossain M      right-hand bat right-arm fast-medium\n",
       "4 486995 Fargana Hoque  M      right-hand bat NA                   \n",
       "5 926629 Hasan Mahmud   M      right-hand bat right-arm medium     \n",
       "6 927619 Khaled Ahmed   M      right-hand bat right-arm medium     \n",
       "  playing_role        country_id country   \n",
       "1 allrounder          25         Bangladesh\n",
       "2 wicketkeeper batter 25         Bangladesh\n",
       "3 bowler              25         Bangladesh\n",
       "4 top-order batter    25         Bangladesh\n",
       "5 bowler              25         Bangladesh\n",
       "6 bowler              25         Bangladesh"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df5<-inner_join(df1,df,by=c('country_id'='id')) #joining the player and country dataframes\n",
    "df5<-df5%>%filter(gender=='M') #filtering men players\n",
    "head(df5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ae2567b1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.228666Z",
     "iopub.status.busy": "2023-02-20T20:07:17.227173Z",
     "iopub.status.idle": "2023-02-20T20:07:17.263052Z",
     "shell.execute_reply": "2023-02-20T20:07:17.261343Z"
    },
    "papermill": {
     "duration": 0.044318,
     "end_time": "2023-02-20T20:07:17.265616",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.221298",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [327 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ id           : num [1:327] 420402 921509 568136 352048 440970 ...\n",
      " $ span         : chr [1:327] \"2013-2022\" \"2019-2022\" \"2016-2022\" \"2012-2022\" ...\n",
      " $ matches      : num [1:327] 2 16 22 55 6 34 16 1 41 17 ...\n",
      " $ innings      : num [1:327] 2 16 3 45 4 34 10 1 26 2 ...\n",
      " $ not_out      : num [1:327] 0 3 3 13 2 3 3 0 4 1 ...\n",
      " $ runs         : num [1:327] 33 381 27 615 48 967 94 20 362 0 ...\n",
      " $ high_score   : chr [1:327] \"24\" \"64*\" \"24*\" \"56*\" ...\n",
      " $ average_score: num [1:327] 16.5 29.3 NA 19.2 24 ...\n",
      " $ ball_faced   : num [1:327] 45 361 24 509 55 708 97 14 328 2 ...\n",
      " $ strike_rate  : num [1:327] 73.3 105.5 112.5 120.8 87.3 ...\n",
      " $ 100s         : num [1:327] 0 0 0 0 0 1 0 0 0 0 ...\n",
      " $ 50           : num [1:327] 0 1 0 1 0 3 0 0 1 0 ...\n",
      " $ 0s           : num [1:327] 0 0 0 3 0 3 0 0 2 1 ...\n",
      " $ 4s           : num [1:327] 1 30 4 45 5 94 7 4 26 0 ...\n",
      " $ 6s           : num [1:327] 1 10 0 27 0 56 2 0 15 0 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   span = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   matches = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   innings = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   not_out = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   runs = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   high_score = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   average_score = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   ball_faced = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   strike_rate = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `100s` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `50` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `0s` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `4s` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `6s` = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(df2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "42d33a6a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.278482Z",
     "iopub.status.busy": "2023-02-20T20:07:17.276962Z",
     "iopub.status.idle": "2023-02-20T20:07:17.316694Z",
     "shell.execute_reply": "2023-02-20T20:07:17.314734Z"
    },
    "papermill": {
     "duration": 0.04892,
     "end_time": "2023-02-20T20:07:17.319753",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.270833",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 327\n",
      "Columns: 22\n",
      "$ id            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 420402, 921509, 568136, 352048, 440970, 793457, 819429, …\n",
      "$ span          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2013-2022\", \"2019-2022\", \"2016-2022\", \"2012-2022\", \"201…\n",
      "$ matches       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 2, 16, 22, 55, 6, 34, 16, 1, 41, 17, 86, 36, 104, 22, 1,…\n",
      "$ innings       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 2, 16, 3, 45, 4, 34, 10, 1, 26, 2, 76, 9, 96, 5, 1, 2, 5…\n",
      "$ not_out       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 3, 3, 13, 2, 3, 3, 0, 4, 1, 25, 5, 16, 4, 1, 1, 10, 1…\n",
      "$ runs          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 33, 381, 27, 615, 48, 967, 94, 20, 362, 0, 1590, 32, 168…\n",
      "$ high_score    \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"24\", \"64*\", \"24*\", \"56*\", \"36\", \"162*\", \"20\", \"20\", \"53…\n",
      "$ average_score \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 16.50, 29.30, NA, 19.21, 24.00, 31.19, 13.42, 20.00, 16.…\n",
      "$ ball_faced    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 45, 361, 24, 509, 55, 708, 97, 14, 328, 2, 1120, 31, 120…\n",
      "$ strike_rate   \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 73.33, 105.54, 112.50, 120.82, 87.27, 136.58, 96.90, 142…\n",
      "$ `100s`        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…\n",
      "$ `50`          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 1, 0, 1, 0, 3, 0, 0, 1, 0, 8, 0, 4, 0, 0, 0, 2, 0, 0,…\n",
      "$ `0s`          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 3, 0, 3, 0, 0, 2, 1, 4, 1, 6, 0, 0, 0, 2, 7, 1,…\n",
      "$ `4s`          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1, 30, 4, 45, 5, 94, 7, 4, 26, 0, 101, 4, 114, 2, 0, 1, …\n",
      "$ `6s`          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1, 10, 0, 27, 0, 56, 2, 0, 15, 0, 88, 1, 89, 0, 0, 0, 37…\n",
      "$ name          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Afsar Zazai\", \"Ibrahim Zadran\", \"Fareed Ahmad\", \"Gulbad…\n",
      "$ gender        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"…\n",
      "$ bating_style  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"right-hand bat\", \"right-hand bat\", \"left-hand bat\", \"ri…\n",
      "$ bowling_style \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m NA, \"right-arm medium-fast\", \"left-arm fast-medium\", \"ri…\n",
      "$ playing_role  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"wicketkeeper batter\", \"opening batter\", \"bowler\", \"batt…\n",
      "$ country_id    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, …\n",
      "$ country       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Afghanistan\", \"Afghanistan\", \"Afghanistan\", \"Afghanista…\n"
     ]
    }
   ],
   "source": [
    "df6<-inner_join(df2,df5,by='id') #joining the player-country dataframe with the t20-batting dataframe \n",
    "glimpse(df6)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f27ac4b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.332946Z",
     "iopub.status.busy": "2023-02-20T20:07:17.331361Z",
     "iopub.status.idle": "2023-02-20T20:07:17.438067Z",
     "shell.execute_reply": "2023-02-20T20:07:17.436393Z"
    },
    "papermill": {
     "duration": 0.115418,
     "end_time": "2023-02-20T20:07:17.440375",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.324957",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 10 × 22</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>span</th><th scope=col>matches</th><th scope=col>innings</th><th scope=col>not_out</th><th scope=col>runs</th><th scope=col>high_score</th><th scope=col>average_score</th><th scope=col>ball_faced</th><th scope=col>strike_rate</th><th scope=col>⋯</th><th scope=col>0s</th><th scope=col>4s</th><th scope=col>6s</th><th scope=col>name</th><th scope=col>gender</th><th scope=col>bating_style</th><th scope=col>bowling_style</th><th scope=col>playing_role</th><th scope=col>country_id</th><th scope=col>country</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td> 34102</td><td>2007-2022</td><td>148</td><td>140</td><td>17</td><td>3853</td><td>118 </td><td>31.32</td><td>2767</td><td>139.24</td><td>⋯</td><td>10</td><td>348</td><td>182</td><td>RG Sharma  </td><td>M</td><td>right-hand bat</td><td>right-arm offbreak                 </td><td>top-order batter   </td><td>6</td><td>India       </td></tr>\n",
       "\t<tr><td>325026</td><td>2012-2022</td><td> 98</td><td> 90</td><td>14</td><td>2159</td><td>145*</td><td>28.40</td><td>1430</td><td>150.97</td><td>⋯</td><td> 3</td><td>176</td><td>106</td><td>GJ Maxwell </td><td>M</td><td>right-hand bat</td><td>right-arm offbreak                 </td><td>batting allrounder </td><td>2</td><td>Australia   </td></tr>\n",
       "\t<tr><td>446507</td><td>2021-2023</td><td> 48</td><td> 46</td><td>10</td><td>1675</td><td>117 </td><td>46.52</td><td> 953</td><td>175.76</td><td>⋯</td><td> 3</td><td>150</td><td> 96</td><td>SA Yadav   </td><td>M</td><td>right-hand bat</td><td>right-arm medium,right-arm offbreak</td><td>batter             </td><td>6</td><td>India       </td></tr>\n",
       "\t<tr><td>226492</td><td>2009-2022</td><td>122</td><td>118</td><td> 7</td><td>3531</td><td>105 </td><td>31.81</td><td>2602</td><td>135.70</td><td>⋯</td><td> 3</td><td>309</td><td>173</td><td>MJ Guptill </td><td>M</td><td>right-hand bat</td><td>right-arm offbreak                 </td><td>opening batter     </td><td>5</td><td>Newziland   </td></tr>\n",
       "\t<tr><td>823509</td><td>2017-2023</td><td> 59</td><td> 52</td><td> 8</td><td>1385</td><td>108 </td><td>31.47</td><td> 957</td><td>144.72</td><td>⋯</td><td> 2</td><td> 95</td><td> 70</td><td>GD Phillips</td><td>M</td><td>right-hand bat</td><td>right-arm offbreak                 </td><td>wicketkeeper batter</td><td>5</td><td>Newziland   </td></tr>\n",
       "\t<tr><td>  5334</td><td>2011-2022</td><td>103</td><td>103</td><td>12</td><td>3120</td><td>172 </td><td>34.28</td><td>2189</td><td>142.53</td><td>⋯</td><td> 8</td><td>309</td><td>125</td><td>AJ Finch   </td><td>M</td><td>right-hand bat</td><td>slow left-arm orthodox             </td><td>top-order batter   </td><td>2</td><td>Australia   </td></tr>\n",
       "\t<tr><td>321777</td><td>2010-2022</td><td>111</td><td> 96</td><td>34</td><td>2147</td><td>106*</td><td>34.62</td><td>1489</td><td>144.19</td><td>⋯</td><td> 1</td><td>141</td><td>103</td><td>DA Miller  </td><td>M</td><td>left-hand bat </td><td>right-arm offbreak                 </td><td>middle-order batter</td><td>3</td><td>South Africa</td></tr>\n",
       "\t<tr><td>422108</td><td>2016-2022</td><td> 72</td><td> 68</td><td> 8</td><td>2265</td><td>110*</td><td>37.75</td><td>1628</td><td>139.12</td><td>⋯</td><td> 5</td><td>191</td><td> 99</td><td>KL Rahul   </td><td>M</td><td>right-hand bat</td><td>NA                                 </td><td>opening batter     </td><td>6</td><td>India       </td></tr>\n",
       "\t<tr><td>348144</td><td>2016-2022</td><td> 99</td><td> 94</td><td>13</td><td>3355</td><td>122 </td><td>41.41</td><td>2625</td><td>127.80</td><td>⋯</td><td> 5</td><td>355</td><td> 50</td><td>Babar Azam </td><td>M</td><td>right-hand bat</td><td>right-arm offbreak                 </td><td>batter             </td><td>7</td><td>Pakistan    </td></tr>\n",
       "\t<tr><td>318845</td><td>2014-2022</td><td> 26</td><td> 24</td><td> 5</td><td> 699</td><td>109 </td><td>36.78</td><td> 448</td><td>156.02</td><td>⋯</td><td> 5</td><td> 62</td><td> 34</td><td>RR Rossouw </td><td>M</td><td>left-hand bat </td><td>right-arm offbreak                 </td><td>top-order batter   </td><td>3</td><td>South Africa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 10 × 22\n",
       "\\begin{tabular}{lllllllllllllllllllll}\n",
       " id & span & matches & innings & not\\_out & runs & high\\_score & average\\_score & ball\\_faced & strike\\_rate & ⋯ & 0s & 4s & 6s & name & gender & bating\\_style & bowling\\_style & playing\\_role & country\\_id & country\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & ⋯ & <dbl> & <dbl> & <dbl> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t  34102 & 2007-2022 & 148 & 140 & 17 & 3853 & 118  & 31.32 & 2767 & 139.24 & ⋯ & 10 & 348 & 182 & RG Sharma   & M & right-hand bat & right-arm offbreak                  & top-order batter    & 6 & India       \\\\\n",
       "\t 325026 & 2012-2022 &  98 &  90 & 14 & 2159 & 145* & 28.40 & 1430 & 150.97 & ⋯ &  3 & 176 & 106 & GJ Maxwell  & M & right-hand bat & right-arm offbreak                  & batting allrounder  & 2 & Australia   \\\\\n",
       "\t 446507 & 2021-2023 &  48 &  46 & 10 & 1675 & 117  & 46.52 &  953 & 175.76 & ⋯ &  3 & 150 &  96 & SA Yadav    & M & right-hand bat & right-arm medium,right-arm offbreak & batter              & 6 & India       \\\\\n",
       "\t 226492 & 2009-2022 & 122 & 118 &  7 & 3531 & 105  & 31.81 & 2602 & 135.70 & ⋯ &  3 & 309 & 173 & MJ Guptill  & M & right-hand bat & right-arm offbreak                  & opening batter      & 5 & Newziland   \\\\\n",
       "\t 823509 & 2017-2023 &  59 &  52 &  8 & 1385 & 108  & 31.47 &  957 & 144.72 & ⋯ &  2 &  95 &  70 & GD Phillips & M & right-hand bat & right-arm offbreak                  & wicketkeeper batter & 5 & Newziland   \\\\\n",
       "\t   5334 & 2011-2022 & 103 & 103 & 12 & 3120 & 172  & 34.28 & 2189 & 142.53 & ⋯ &  8 & 309 & 125 & AJ Finch    & M & right-hand bat & slow left-arm orthodox              & top-order batter    & 2 & Australia   \\\\\n",
       "\t 321777 & 2010-2022 & 111 &  96 & 34 & 2147 & 106* & 34.62 & 1489 & 144.19 & ⋯ &  1 & 141 & 103 & DA Miller   & M & left-hand bat  & right-arm offbreak                  & middle-order batter & 3 & South Africa\\\\\n",
       "\t 422108 & 2016-2022 &  72 &  68 &  8 & 2265 & 110* & 37.75 & 1628 & 139.12 & ⋯ &  5 & 191 &  99 & KL Rahul    & M & right-hand bat & NA                                  & opening batter      & 6 & India       \\\\\n",
       "\t 348144 & 2016-2022 &  99 &  94 & 13 & 3355 & 122  & 41.41 & 2625 & 127.80 & ⋯ &  5 & 355 &  50 & Babar Azam  & M & right-hand bat & right-arm offbreak                  & batter              & 7 & Pakistan    \\\\\n",
       "\t 318845 & 2014-2022 &  26 &  24 &  5 &  699 & 109  & 36.78 &  448 & 156.02 & ⋯ &  5 &  62 &  34 & RR Rossouw  & M & left-hand bat  & right-arm offbreak                  & top-order batter    & 3 & South Africa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 10 × 22\n",
       "\n",
       "| id &lt;dbl&gt; | span &lt;chr&gt; | matches &lt;dbl&gt; | innings &lt;dbl&gt; | not_out &lt;dbl&gt; | runs &lt;dbl&gt; | high_score &lt;chr&gt; | average_score &lt;dbl&gt; | ball_faced &lt;dbl&gt; | strike_rate &lt;dbl&gt; | ⋯ ⋯ | 0s &lt;dbl&gt; | 4s &lt;dbl&gt; | 6s &lt;dbl&gt; | name &lt;chr&gt; | gender &lt;chr&gt; | bating_style &lt;chr&gt; | bowling_style &lt;chr&gt; | playing_role &lt;chr&gt; | country_id &lt;dbl&gt; | country &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "|  34102 | 2007-2022 | 148 | 140 | 17 | 3853 | 118  | 31.32 | 2767 | 139.24 | ⋯ | 10 | 348 | 182 | RG Sharma   | M | right-hand bat | right-arm offbreak                  | top-order batter    | 6 | India        |\n",
       "| 325026 | 2012-2022 |  98 |  90 | 14 | 2159 | 145* | 28.40 | 1430 | 150.97 | ⋯ |  3 | 176 | 106 | GJ Maxwell  | M | right-hand bat | right-arm offbreak                  | batting allrounder  | 2 | Australia    |\n",
       "| 446507 | 2021-2023 |  48 |  46 | 10 | 1675 | 117  | 46.52 |  953 | 175.76 | ⋯ |  3 | 150 |  96 | SA Yadav    | M | right-hand bat | right-arm medium,right-arm offbreak | batter              | 6 | India        |\n",
       "| 226492 | 2009-2022 | 122 | 118 |  7 | 3531 | 105  | 31.81 | 2602 | 135.70 | ⋯ |  3 | 309 | 173 | MJ Guptill  | M | right-hand bat | right-arm offbreak                  | opening batter      | 5 | Newziland    |\n",
       "| 823509 | 2017-2023 |  59 |  52 |  8 | 1385 | 108  | 31.47 |  957 | 144.72 | ⋯ |  2 |  95 |  70 | GD Phillips | M | right-hand bat | right-arm offbreak                  | wicketkeeper batter | 5 | Newziland    |\n",
       "|   5334 | 2011-2022 | 103 | 103 | 12 | 3120 | 172  | 34.28 | 2189 | 142.53 | ⋯ |  8 | 309 | 125 | AJ Finch    | M | right-hand bat | slow left-arm orthodox              | top-order batter    | 2 | Australia    |\n",
       "| 321777 | 2010-2022 | 111 |  96 | 34 | 2147 | 106* | 34.62 | 1489 | 144.19 | ⋯ |  1 | 141 | 103 | DA Miller   | M | left-hand bat  | right-arm offbreak                  | middle-order batter | 3 | South Africa |\n",
       "| 422108 | 2016-2022 |  72 |  68 |  8 | 2265 | 110* | 37.75 | 1628 | 139.12 | ⋯ |  5 | 191 |  99 | KL Rahul    | M | right-hand bat | NA                                  | opening batter      | 6 | India        |\n",
       "| 348144 | 2016-2022 |  99 |  94 | 13 | 3355 | 122  | 41.41 | 2625 | 127.80 | ⋯ |  5 | 355 |  50 | Babar Azam  | M | right-hand bat | right-arm offbreak                  | batter              | 7 | Pakistan     |\n",
       "| 318845 | 2014-2022 |  26 |  24 |  5 |  699 | 109  | 36.78 |  448 | 156.02 | ⋯ |  5 |  62 |  34 | RR Rossouw  | M | left-hand bat  | right-arm offbreak                  | top-order batter    | 3 | South Africa |\n",
       "\n"
      ],
      "text/plain": [
       "   id     span      matches innings not_out runs high_score average_score\n",
       "1   34102 2007-2022 148     140     17      3853 118        31.32        \n",
       "2  325026 2012-2022  98      90     14      2159 145*       28.40        \n",
       "3  446507 2021-2023  48      46     10      1675 117        46.52        \n",
       "4  226492 2009-2022 122     118      7      3531 105        31.81        \n",
       "5  823509 2017-2023  59      52      8      1385 108        31.47        \n",
       "6    5334 2011-2022 103     103     12      3120 172        34.28        \n",
       "7  321777 2010-2022 111      96     34      2147 106*       34.62        \n",
       "8  422108 2016-2022  72      68      8      2265 110*       37.75        \n",
       "9  348144 2016-2022  99      94     13      3355 122        41.41        \n",
       "10 318845 2014-2022  26      24      5       699 109        36.78        \n",
       "   ball_faced strike_rate ⋯ 0s 4s  6s  name        gender bating_style  \n",
       "1  2767       139.24      ⋯ 10 348 182 RG Sharma   M      right-hand bat\n",
       "2  1430       150.97      ⋯  3 176 106 GJ Maxwell  M      right-hand bat\n",
       "3   953       175.76      ⋯  3 150  96 SA Yadav    M      right-hand bat\n",
       "4  2602       135.70      ⋯  3 309 173 MJ Guptill  M      right-hand bat\n",
       "5   957       144.72      ⋯  2  95  70 GD Phillips M      right-hand bat\n",
       "6  2189       142.53      ⋯  8 309 125 AJ Finch    M      right-hand bat\n",
       "7  1489       144.19      ⋯  1 141 103 DA Miller   M      left-hand bat \n",
       "8  1628       139.12      ⋯  5 191  99 KL Rahul    M      right-hand bat\n",
       "9  2625       127.80      ⋯  5 355  50 Babar Azam  M      right-hand bat\n",
       "10  448       156.02      ⋯  5  62  34 RR Rossouw  M      left-hand bat \n",
       "   bowling_style                       playing_role        country_id\n",
       "1  right-arm offbreak                  top-order batter    6         \n",
       "2  right-arm offbreak                  batting allrounder  2         \n",
       "3  right-arm medium,right-arm offbreak batter              6         \n",
       "4  right-arm offbreak                  opening batter      5         \n",
       "5  right-arm offbreak                  wicketkeeper batter 5         \n",
       "6  slow left-arm orthodox              top-order batter    2         \n",
       "7  right-arm offbreak                  middle-order batter 3         \n",
       "8  NA                                  opening batter      6         \n",
       "9  right-arm offbreak                  batter              7         \n",
       "10 right-arm offbreak                  top-order batter    3         \n",
       "   country     \n",
       "1  India       \n",
       "2  Australia   \n",
       "3  India       \n",
       "4  Newziland   \n",
       "5  Newziland   \n",
       "6  Australia   \n",
       "7  South Africa\n",
       "8  India       \n",
       "9  Pakistan    \n",
       "10 South Africa"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Players with highest number of 100s\n",
    "df7<-df6\n",
    "df7<-df7%>%drop_na(span) #dropping the players with no span\n",
    "df7<-df7%>%rename('hundreds'='100s') #Renaming the column\n",
    "df7<-df7%>%drop_na(hundreds)\n",
    "df7<-df7[order(df7$hundreds, decreasing=TRUE),]\n",
    "df7<-head(df7,n=10)\n",
    "df7"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6142b675",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.453850Z",
     "iopub.status.busy": "2023-02-20T20:07:17.452255Z",
     "iopub.status.idle": "2023-02-20T20:07:17.488649Z",
     "shell.execute_reply": "2023-02-20T20:07:17.486921Z"
    },
    "papermill": {
     "duration": 0.045831,
     "end_time": "2023-02-20T20:07:17.491233",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.445402",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Name</th><th scope=col>100s</th><th scope=col>Country</th><th scope=col>Strike Rate</th><th scope=col>High Score</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>RG Sharma  </td><td>4</td><td>India       </td><td>139.24</td><td>118 </td></tr>\n",
       "\t<tr><td>GJ Maxwell </td><td>3</td><td>Australia   </td><td>150.97</td><td>145*</td></tr>\n",
       "\t<tr><td>SA Yadav   </td><td>3</td><td>India       </td><td>175.76</td><td>117 </td></tr>\n",
       "\t<tr><td>MJ Guptill </td><td>2</td><td>Newziland   </td><td>135.70</td><td>105 </td></tr>\n",
       "\t<tr><td>GD Phillips</td><td>2</td><td>Newziland   </td><td>144.72</td><td>108 </td></tr>\n",
       "\t<tr><td>AJ Finch   </td><td>2</td><td>Australia   </td><td>142.53</td><td>172 </td></tr>\n",
       "\t<tr><td>DA Miller  </td><td>2</td><td>South Africa</td><td>144.19</td><td>106*</td></tr>\n",
       "\t<tr><td>KL Rahul   </td><td>2</td><td>India       </td><td>139.12</td><td>110*</td></tr>\n",
       "\t<tr><td>Babar Azam </td><td>2</td><td>Pakistan    </td><td>127.80</td><td>122 </td></tr>\n",
       "\t<tr><td>RR Rossouw </td><td>2</td><td>South Africa</td><td>156.02</td><td>109 </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Name & 100s & Country & Strike Rate & High Score\\\\\n",
       " <chr> & <dbl> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t RG Sharma   & 4 & India        & 139.24 & 118 \\\\\n",
       "\t GJ Maxwell  & 3 & Australia    & 150.97 & 145*\\\\\n",
       "\t SA Yadav    & 3 & India        & 175.76 & 117 \\\\\n",
       "\t MJ Guptill  & 2 & Newziland    & 135.70 & 105 \\\\\n",
       "\t GD Phillips & 2 & Newziland    & 144.72 & 108 \\\\\n",
       "\t AJ Finch    & 2 & Australia    & 142.53 & 172 \\\\\n",
       "\t DA Miller   & 2 & South Africa & 144.19 & 106*\\\\\n",
       "\t KL Rahul    & 2 & India        & 139.12 & 110*\\\\\n",
       "\t Babar Azam  & 2 & Pakistan     & 127.80 & 122 \\\\\n",
       "\t RR Rossouw  & 2 & South Africa & 156.02 & 109 \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 5\n",
       "\n",
       "| Name &lt;chr&gt; | 100s &lt;dbl&gt; | Country &lt;chr&gt; | Strike Rate &lt;dbl&gt; | High Score &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| RG Sharma   | 4 | India        | 139.24 | 118  |\n",
       "| GJ Maxwell  | 3 | Australia    | 150.97 | 145* |\n",
       "| SA Yadav    | 3 | India        | 175.76 | 117  |\n",
       "| MJ Guptill  | 2 | Newziland    | 135.70 | 105  |\n",
       "| GD Phillips | 2 | Newziland    | 144.72 | 108  |\n",
       "| AJ Finch    | 2 | Australia    | 142.53 | 172  |\n",
       "| DA Miller   | 2 | South Africa | 144.19 | 106* |\n",
       "| KL Rahul    | 2 | India        | 139.12 | 110* |\n",
       "| Babar Azam  | 2 | Pakistan     | 127.80 | 122  |\n",
       "| RR Rossouw  | 2 | South Africa | 156.02 | 109  |\n",
       "\n"
      ],
      "text/plain": [
       "   Name        100s Country      Strike Rate High Score\n",
       "1  RG Sharma   4    India        139.24      118       \n",
       "2  GJ Maxwell  3    Australia    150.97      145*      \n",
       "3  SA Yadav    3    India        175.76      117       \n",
       "4  MJ Guptill  2    Newziland    135.70      105       \n",
       "5  GD Phillips 2    Newziland    144.72      108       \n",
       "6  AJ Finch    2    Australia    142.53      172       \n",
       "7  DA Miller   2    South Africa 144.19      106*      \n",
       "8  KL Rahul    2    India        139.12      110*      \n",
       "9  Babar Azam  2    Pakistan     127.80      122       \n",
       "10 RR Rossouw  2    South Africa 156.02      109       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df8<-data.frame(df7$name,df7$hundreds,df7$country,df7$strike_rate,df7$high_score)\n",
    "df8<-df8%>%rename('Name'='df7.name','100s'='df7.hundreds','Country'='df7.country','Strike Rate'='df7.strike_rate','High Score'='df7.high_score')\n",
    "df8 #Top 10 players havign the most number of 100s in t20"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "59a2cc88",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T20:07:17.504996Z",
     "iopub.status.busy": "2023-02-20T20:07:17.503486Z",
     "iopub.status.idle": "2023-02-20T20:07:17.540401Z",
     "shell.execute_reply": "2023-02-20T20:07:17.538208Z"
    },
    "papermill": {
     "duration": 0.04655,
     "end_time": "2023-02-20T20:07:17.543027",
     "exception": false,
     "start_time": "2023-02-20T20:07:17.496477",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 347\n",
      "Columns: 25\n",
      "$ id            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 935995, 380354, 932355, 926629, 536936, 833087, 629063, …\n",
      "$ sp            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2020-2022\", \"2012-2022\", \"2022-2022\", \"2021-2022\", \"201…\n",
      "$ bbi           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Jan-00\", NA, \"Apr-47\", \"28-Mar\", NA, \"Feb-42\", \"25-Apr\"…\n",
      "$ bbm           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Jan-00\", NA, \"Apr-47\", \"28-Mar\", NA, \"Feb-42\", \"25-Apr\"…\n",
      "$ bl            \u001b[3m\u001b[90m<lgl>\u001b[39m\u001b[23m NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …\n",
      "$ bwa           \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 22.66, NA, 19.09, 32.00, NA, 52.50, 32.89, NA, 27.14, 57…\n",
      "$ bwe           \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 4.97, NA, 5.94, 5.90, NA, 4.56, 4.66, NA, 4.87, 5.14, 5.…\n",
      "$ bwsr          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 27.3, NA, 19.2, 32.5, NA, 69.0, 42.3, NA, 33.4, 66.4, 28…\n",
      "$ cd            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 68, NA, 210, 256, NA, 105, 2599, NA, 190, 969, 3370, NA,…\n",
      "$ fw            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, NA, 0, 0, NA, 0, 0, NA, 0, 0, 5, NA, 0, 0, NA, 0, 0, …\n",
      "$ fwk           \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, NA, 1, 0, NA, 0, 5, NA, 0, 0, 4, NA, 0, 0, NA, 0, 0, …\n",
      "$ `in`          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8, NA, 4, 6, NA, 3, 66, NA, 12, 41, 81, NA, 1, 4, NA, 21…\n",
      "$ md            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1, NA, 1, 3, NA, 1, 24, NA, 1, 2, 28, NA, 0, 8, NA, 0, 1…\n",
      "$ mt            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 22, 44, 4, 6, 60, 3, 67, 2, 28, 43, 82, 239, 15, 4, 6, 6…\n",
      "$ ov            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 13.4, NA, 35.2, 43.2, NA, 23.0, 557.3, NA, 39.0, 188.2, …\n",
      "$ pr            \u001b[3m\u001b[90m<lgl>\u001b[39m\u001b[23m NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …\n",
      "$ tw            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, NA, 0, 0, NA, 0, 0, NA, 0, 0, 0, NA, 0, 0, NA, 0, 0, …\n",
      "$ wk            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 3, NA, 11, 8, NA, 2, 79, NA, 7, 17, 141, NA, 0, 5, NA, 3…\n",
      "$ name          \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Afif Hossain\", \"Anamul Haque\", \"Ebadot Hossain\", \"Hasan…\n",
      "$ gender        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"M\", \"…\n",
      "$ bating_style  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"left-hand bat\", \"right-hand bat\", \"right-hand bat\", \"ri…\n",
      "$ bowling_style \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"right-arm offbreak\", NA, \"right-arm fast-medium\", \"righ…\n",
      "$ playing_role  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"allrounder\", \"wicketkeeper batter\", \"bowler\", \"bowler\",…\n",
      "$ country_id    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, …\n",
      "$ country       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Bangladesh\", \"Bangladesh\", \"Bangladesh\", \"Bangladesh\", …\n"
     ]
    }
   ],
   "source": [
    "df9<-inner_join(df3,df5,by='id') #joining the player-country dataframe with the t20-batting dataframe \n",
    "glimpse(df9)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.269406,
   "end_time": "2023-02-20T20:07:17.670344",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T20:07:11.400938",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
