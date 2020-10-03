infra:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Bringing Vagrant Infrastructure up using virtualbox"
	@echo ""
	@vagrant up --provider virtualbox

prereq:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Installing required Python Libraries"
	@echo ""
	@pip install -r requirements.txt

bootstrap:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Deploying packages on the machines and bootstraping Consul"
	@echo ""
	@cd ansible
	@ansible-playbook -i inventory site.yml -e "bootstrap=True"

rerun:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Deploy or update packages on the machines without bootstraping Consul"
	@echo ""
	@cd ansible
	@ansible-playbook -i inventory site.yml

show:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Current provisioned Vagrant infrastructure"
	@echo ""
	@vagrant status

clean:
	@echo ""
	@echo "--------------------------------------------------------------------"
	@echo "Destroying Vagrant Infrastructure"
	@echo ""
	@vagrant destroy -f