format:
	black .

shell:
	python manage.py shell_plus

dump:
	python manage.py dumpscript myapp > dump_data.py
