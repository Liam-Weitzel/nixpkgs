{
  lib,
  buildPythonPackage,
  click,
  dateutils,
  fetchFromGitHub,
  hatchling,
  hypothesis,
  importlib-metadata,
  jinja2,
  jsonschema,
  more-itertools,
  pydantic,
  pytestCheckHook,
  pythonOlder,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "dbt-semantic-interfaces";
  version = "0.8.5";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "dbt-labs";
    repo = "dbt-semantic-interfaces";
    tag = "v${version}";
    hash = "sha256-fe+0W08XfBzimQZugCpphrHYcDaoUUYkA+FYa2lS3Uo=";
  };

  pythonRelaxDeps = [ "importlib-metadata" ];

  build-system = [
    hatchling
  ];

  dependencies = [
    click
    dateutils
    importlib-metadata
    jinja2
    jsonschema
    more-itertools
    pydantic
    pyyaml
    typing-extensions
  ];

  nativeCheckInputs = [
    pytestCheckHook
    hypothesis
  ];

  pythonImportsCheck = [ "dbt_semantic_interfaces" ];

  meta = with lib; {
    description = "Shared interfaces used by dbt-core and MetricFlow projects";
    homepage = "https://github.com/dbt-labs/dbt-semantic-interfaces";
    changelog = "https://github.com/dbt-labs/dbt-semantic-interfaces/releases/tag/${src.tag}";
    license = licenses.asl20;
    maintainers = with maintainers; [ pbsds ];
  };
}
