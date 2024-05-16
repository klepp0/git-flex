.PHONY: workout help

WORKOUT_SCRIPT = ./gym/workout.sh

workout:
	@$(WORKOUT_SCRIPT)

help:
	@echo "Usage:"
	@echo "  make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  workout    Run the workout.sh script"
	@echo "  help       Display this help message"
