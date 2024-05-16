.PHONY: help setup workout

WORKOUT_SCRIPT = ./gym/workout.sh

setup:
	@chmod +x $(WORKOUT_SCRIPT)
	@echo "Setting up crontab entry:"
	@CRON_JOB="0 * * * * cd $$(pwd) && make workout" && \
	echo "$$CRON_JOB" && \
	(crontab -l 2>/dev/null | grep -v "make workout"; echo "$$CRON_JOB") | crontab -
	@echo "Setup complete. The workout script will run every hour."

workout:
	@$(WORKOUT_SCRIPT)

help:
	@echo "Usage:"
	@echo "  make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  setup      Set permissions and add a crontab job to run workout every hour"
	@echo "  workout    Run the workout.sh script"
	@echo "  help       Display this help message"
